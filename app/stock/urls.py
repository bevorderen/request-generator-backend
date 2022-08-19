from django.urls import path

from stock import views

urlpatterns = [
    path('list', views.StockListApi.as_view(), name="list"),
    path('detail/<int:pk>', views.StockDetailApi.as_view(), name="stock-detail"),
]
