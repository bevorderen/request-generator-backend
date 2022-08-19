from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase

from stock.constants import StockType
from stock.models import Stock


class TestCreateDVOrder(APITestCase):
    def setUp(self) -> None:
        url = reverse("signup")
        data = {
            "email": "a@mail.ru",
            "last_name": "last_name",
            "first_name": "first_name",
            "snils": "0123456789",
        }
        response = self.client.post(url, data, format="json")
        response_json = response.json()
        self.user = User.objects.get(username=response_json["username"])
        self.token = Token.objects.create(user=self.user)

        Stock.objects.create(
            id=1,
            title="Test stock",
            description="Test stock",
            short_description="Test stock",
            price=1000,
            type=StockType.DV,
        )

        Stock.objects.create(
            id=2,
            title="Test OV stock",
            description="Test OV stock",
            short_description="Test OV stock",
            price=1000,
            type=StockType.OV,
            discount=10,
        )

    def test_get_dv_stock(self):
        url = reverse("stock-detail", args=[1])
        response = self.client.get(url, HTTP_AUTHORIZATION='Token ' + self.token.key)
        response_json = response.json()
        self.assertEqual(
            {
                'id': 1,
                'total_price': 1000.0,
                'type': 'Domain Validation',
                'title': 'Test stock',
                'description': 'Test stock',
                'short_description': 'Test stock',
                'price': 1000,
                'discount': 0
            }
            ,
            response_json)

    def test_get_ov_stock_with_discount(self):
        url = reverse("stock-detail", args=[2])
        response = self.client.get(url, HTTP_AUTHORIZATION='Token ' + self.token.key)
        response_json = response.json()
        self.assertEqual(
            {
                'id': 2,
                'total_price': 900.0,
                'type': 'Organization Validation',
                'title': 'Test OV stock',
                'description': 'Test OV stock',
                'short_description': 'Test OV stock',
                'price': 1000,
                'discount': 10
            },
            response_json
        )

    def test_get_stock_list(self):
        url = reverse("list")
        response = self.client.get(url, HTTP_AUTHORIZATION='Token ' + self.token.key)
        response_json = response.json()
        self.assertEqual([
            {
                'id': 1,
                'total_price': 1000.0,
                'type': 'Domain Validation',
                'title': 'Test stock',
                'description': 'Test stock',
                'short_description': 'Test stock',
                'price': 1000,
                'discount': 0
            },
            {
                'id': 2,
                'total_price': 900.0,
                'type': 'Organization Validation',
                'title': 'Test OV stock',
                'description': 'Test OV stock',
                'short_description': 'Test OV stock',
                'price': 1000,
                'discount': 10
            }
        ],
            response_json
        )
