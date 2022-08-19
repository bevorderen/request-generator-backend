from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework import status
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

    def test_create_create_dv_order(self):
        url = reverse("create")
        data = {
            "extKeyUsage": [
                "1.3.6.1.5.5.7.3.1",
                "1.3.6.1.5.5.7.3.2"
            ],
            "subject": {
                "commonName": "www.google.ru",
                "countryName": "RU",
                "subjectAltName": [
                    "DNS:www.google.ru",
                    "DNS:www.гугл.рф"
                ]
            },
            "stock_id": 1
        }
        response = self.client.post(url, data, format="json", HTTP_AUTHORIZATION='Token ' + self.token.key)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        response_json = response.json()
        # pop data which different every time
        self.assertEqual("updated" in response_json, True)
        response_json.pop("updated")
        self.assertEqual("created" in response_json, True)
        response_json.pop("created")
        self.assertEqual("request" in response_json, True)
        response_json.pop("request")
        self.assertEqual("key" in response_json, True)
        response_json.pop("key")
        self.assertEqual("certificate" in response_json, True)
        response_json.pop("certificate")
        response_json.pop("pk")
        self.assertEqual(
            {
                'request_data':
                    {
                        'extKeyUsage': ['1.3.6.1.5.5.7.3.1', '1.3.6.1.5.5.7.3.2'],
                        'subject':
                            {
                                'commonName': 'www.google.ru', 'countryName': 'RU',
                                'subjectAltName': ['DNS:www.google.ru', 'DNS:www.гугл.рф']
                            },
                        'stock_id': 1
                    },
            },
            response_json
        )

    def test_get_detail(self):
        url = reverse("detail", args=[0])
        response = self.client.get(url, HTTP_AUTHORIZATION='Token ' + self.token.key)
        response_json = response.json()
        self.assertEqual({'detail': 'Not found.'}, response_json)

        create_url = reverse("create")
        data = {
            "extKeyUsage": [
                "1.3.6.1.5.5.7.3.1",
                "1.3.6.1.5.5.7.3.2"
            ],
            "subject": {
                "commonName": "www.google.ru",
                "countryName": "RU",
                "subjectAltName": [
                    "DNS:www.google.ru",
                    "DNS:www.гугл.рф"
                ]
            },
            "stock_id": 1
        }
        resp = self.client.post(create_url, data, format="json", HTTP_AUTHORIZATION='Token ' + self.token.key)
        detail_url = reverse("detail", args=[resp.json()["pk"]])

        response_after_create = self.client.get(detail_url, HTTP_AUTHORIZATION='Token ' + self.token.key)
        response_after_create_json = response_after_create.json()
        self.assertEqual("created" in response_after_create_json, True)
        response_after_create_json.pop("created")
        self.assertEqual("updated" in response_after_create_json, True)
        response_after_create_json.pop("updated")
        response_after_create_json.pop("pk")
        self.assertEqual(
            {
                'request_data': {
                    'subject': {
                        'commonName': 'www.google.ru', 'countryName': 'RU',
                        'subjectAltName': ['DNS:www.google.ru', 'DNS:www.гугл.рф']
                    },
                    'stock_id': 1,
                    'extKeyUsage': ['1.3.6.1.5.5.7.3.1', '1.3.6.1.5.5.7.3.2']
                },
            },
            response_after_create.json()
        )


class TestCreateOVOrder(APITestCase):
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
            id=2,
            title="Test stock",
            description="Test stock",
            short_description="Test stock",
            price=1000,
            type=StockType.OV,
        )

    def test_create_create_dv_order(self):
        url = reverse("create")
        data = {
            "extKeyUsage": [
                "1.3.6.1.5.5.7.3.1",
                "1.3.6.1.5.5.7.3.2"
            ],
            "keyUsage": [
                "digitalSignature",
                "keyEncipherment"
            ],
            "subject": {
                "commonName": "www.google.ru",
                "organizationName": "Romashka",
                "countryName": "RU",
                "subjectAltName": [
                    "DNS:www.google.ru",
                    "DNS:www.гугл.рф"
                ],
                "stateOrProvinceName": "77 г. Москва",
                "localityName": "г. Москва",
                "streetAddress": "улица Удальцова, дом 85"
            },
            "stock_id": 2
        }
        response = self.client.post(url, data, format="json", HTTP_AUTHORIZATION='Token ' + self.token.key)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        response_json = response.json()
        # pop data which different every time
        self.assertEqual("updated" in response_json, True)
        response_json.pop("updated")
        self.assertEqual("created" in response_json, True)
        response_json.pop("created")
        self.assertEqual("request" in response_json, True)
        response_json.pop("request")
        self.assertEqual("key" in response_json, True)
        response_json.pop("key")
        self.assertEqual("certificate" in response_json, True)
        response_json.pop("certificate")
        response_json.pop("pk")
        self.assertEqual(
            {
                'request_data':
                    {
                        'extKeyUsage': ['1.3.6.1.5.5.7.3.1', '1.3.6.1.5.5.7.3.2'],
                        'keyUsage': ['digitalSignature', 'keyEncipherment'],
                        'subject': {
                            'commonName': 'www.google.ru', 'organizationName': 'Romashka',
                            'countryName': 'RU',
                            'subjectAltName': ['DNS:www.google.ru', 'DNS:www.гугл.рф'],
                            'stateOrProvinceName': '77 г. Москва', 'localityName': 'г. Москва',
                            'streetAddress': 'улица Удальцова, дом 85'
                        },
                        'stock_id': 2
                    }
            },
            response_json
        )
