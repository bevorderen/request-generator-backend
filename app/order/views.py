from django.db import transaction
from rest_framework import serializers
from rest_framework.generics import RetrieveAPIView
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from common.views import ApiErrorsMixin
from order.models import Order
from order.serializers.order import OrderSerializer
from order.services.certificate import order_create_certificate
from order.services.request import order_create


class OrderCreateApi(ApiErrorsMixin, APIView):
    # authentication_classes = (TokenAuthentication, BasicAuthentication)
    # permission_classes = (IsAuthenticated)
    @transaction.atomic
    def post(self, request: Request):
        order = order_create(
            data=request.data,
            user=request.user,
        )
        return Response(order)


class OrderDetailApi(ApiErrorsMixin, RetrieveAPIView):
    # authentication_classes = (TokenAuthentication, BasicAuthentication)
    # permission_classes = (IsAuthenticated, OrderPermission)
    serializer_class = OrderSerializer
    queryset = Order.objects.all()


class OrderCertificateCreate(ApiErrorsMixin, APIView):
    # authentication_classes = (TokenAuthentication, BasicAuthentication)
    # permission_classes = (IsAuthenticated, OrderPermission)
    class OrderCertificateCreateInputSerializer(serializers.Serializer):
        certificate_request = serializers.CharField()
        private_key = serializers.CharField()

    class OrderCertificateCreateOutputSerializer(serializers.Serializer):
        certificate = serializers.CharField()

    def post(self, request: Request):
        return Response(order_create_certificate(data=request.data))
