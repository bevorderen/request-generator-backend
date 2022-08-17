from django.contrib import admin
from django.contrib.admin import display

from common.views import SearchHelpTextAdminMixin
from order.models import Order


@admin.register(Order)
class OrderAdmin(SearchHelpTextAdminMixin, admin.ModelAdmin):
    search_fields = ['id', "certificate_owner__last_name"]
    list_per_page = 50
    list_display = [
        'id',
    ]

    @display(description='Certificate owner full name')
    def get_author(self, order: Order):
        return order.certificate_owner.fio
