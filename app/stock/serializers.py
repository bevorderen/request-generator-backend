from rest_framework import serializers

from stock.models import Stock


class StockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Stock
        fields = "__all__"

    total_price = serializers.SerializerMethodField()

    def get_total_price(self, stock: Stock):
        return stock.price - stock.price * stock.discount / 100
