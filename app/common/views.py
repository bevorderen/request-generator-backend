from django.core.exceptions import ValidationError, ObjectDoesNotExist
from django.http import HttpRequest
from rest_framework import exceptions as rest_exceptions

from common.utils import get_error_message


# noinspection PyUnresolvedReferences
class ApiErrorsMixin:
    """
    Mixin that transforms Django and Python exceptions into rest_framework ones.
    Without the mixin, they return 500 status code which is not desired.
    """
    expected_exceptions = {
        ValidationError: rest_exceptions.ValidationError,
        PermissionError: rest_exceptions.PermissionDenied,
        ObjectDoesNotExist: rest_exceptions.NotFound,
    }

    def handle_exception(self, exc):
        exception_ancestors = exc.__class__.__mro__[:-1]  # Without `object`

        for ancestor_class in exception_ancestors:
            drf_exception_class = self.expected_exceptions.get(ancestor_class)

            if drf_exception_class is None:
                continue

            drf_exception = drf_exception_class(get_error_message(exc))

            return super().handle_exception(drf_exception)

        return super().handle_exception(exc)


# noinspection PyUnresolvedReferences, PyProtectedMember
class SearchHelpTextAdminMixin:
    RELATED_SPLITTER = '__'

    def changelist_view(self, request: HttpRequest, extra_context=None):
        if not self.search_fields:
            return super().changelist_view(request, extra_context)

        extra_context = extra_context or {}
        extra_context.update({
            'display_search_help_text': True,
            'search_fields_help_text': self._get_search_fields_help_text(),
        })
        return super().changelist_view(request, extra_context)

    def _get_search_fields_help_text(self) -> str:
        help_text = []
        for field in self.search_fields:
            if self.RELATED_SPLITTER in field:
                verbose_field = self._get_verbose_field_path(field)
            else:
                verbose_field = self.model._meta.get_field(field).verbose_name
            help_text.append(verbose_field)
        return ", ".join(help_text)

    def _get_verbose_field_path(self, field_path: str) -> str:
        field_path = field_path.split(self.RELATED_SPLITTER)
        model = self.model
        verbose_field_path = []
        for field_name in field_path:
            field = model._meta.get_field(field_name)
            model = field.related_model
            try:
                verbose_field_path.append(str(field.verbose_name))
            except AttributeError:
                pass
        return " -> ".join(verbose_field_path)
