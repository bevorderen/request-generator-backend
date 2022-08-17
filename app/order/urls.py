from django.urls import path

from order import views

urlpatterns = [
    path('create', views.OrderCreateApi.as_view(), name="create"),
    path('detail/<int:pk>', views.OrderDetailApi.as_view(), name="detail"),
    path('<int:pk>/create-certificate', views.OrderCertificateCreate.as_view(), name="create-certificate"),
]
