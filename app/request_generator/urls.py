from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'api/auth/', include('dj_rest_auth.urls')),
    path(r'api/person/', include('person.urls')),
    path(r'api/stock/', include('stock.urls')),
    path(r'api/order/', include('order.urls')),
]
