from rest_framework.authtoken.admin import User
from rest_framework.permissions import BasePermission
from rest_framework.request import Request

from order.models import Order


class OrderPermission(BasePermission):
    def has_object_permission(self, request: Request, view, order: Order) -> bool:
        user: User = request.user
        return order.certificate_owner.id == user.id

