# Register your models here.
from django.contrib import admin

from common.views import SearchHelpTextAdminMixin
from stock.models import Stock


@admin.register(Stock)
class StockAdmin(SearchHelpTextAdminMixin, admin.ModelAdmin):
    search_fields = ['id', "title"]
    list_per_page = 50
    list_display = ['id', 'title', 'price']
