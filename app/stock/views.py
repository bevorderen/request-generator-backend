from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import TokenAuthentication, BasicAuthentication
from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated

from common.views import ApiErrorsMixin
from stock.models import Stock
from stock.serializers import StockSerializer


class StockListApi(ApiErrorsMixin, ListAPIView):
    # authentication_classes = (TokenAuthentication, BasicAuthentication)
    # permission_classes = (IsAuthenticated,)
    serializer_class = StockSerializer
    filter_backends = (DjangoFilterBackend,)
    queryset = Stock.objects.all()


class StockDetailApi(ApiErrorsMixin, RetrieveAPIView):
    # authentication_classes = (TokenAuthentication, BasicAuthentication)
    # permission_classes = (IsAuthenticated,)
    serializer_class = StockSerializer
    queryset = Stock.objects.all()
