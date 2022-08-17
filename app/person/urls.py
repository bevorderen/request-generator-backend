from django.urls import path

from person import views

urlpatterns = [
    path('signup', views.SignUpApi.as_view(), name="signup"),
]
