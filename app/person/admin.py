from django.contrib import admin

from common.views import SearchHelpTextAdminMixin
from person.models import Person


@admin.register(Person)
class PersonAdmin(SearchHelpTextAdminMixin, admin.ModelAdmin):
    search_fields = ['id', "snils", "user__email"]
    list_per_page = 50
    list_select_related = ["user"]
    list_display = ['id', 'last_name', 'first_name', 'snils']
    exclude = ["user"]

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, instance=None):
        return False
