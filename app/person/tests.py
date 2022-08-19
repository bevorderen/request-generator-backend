from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from person.models import Person


class TestCreateUser(APITestCase):
    def test_create_user_with_minimal_field(self):
        url = reverse('signup')
        last_name = "last_name"
        first_name = "first_name"
        snils = "123456789"
        data = {
            "email": "a@mail.ru",
            "last_name": last_name,
            "first_name": first_name,
            "snils": snils,
        }
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        response_json = response.json()
        created_user = User.objects.get(username=response_json["username"])
        self.assertEqual(created_user.last_name, last_name)
        self.assertEqual(created_user.first_name, first_name)
        self.assertEqual(Person.objects.filter(user__username=response_json["username"]).exists(), True)
        person = Person.objects.get(user__username=response_json["username"])
        self.assertEqual(person.snils, snils)
        self.assertEqual(person.phone, None)
        self.assertEqual(person.inn, None)

    def test_create_user_with_maximum_field(self):
        url = reverse('signup')
        last_name = "test test"
        first_name = "my name"
        snils = "123456789"
        phone = "88005553535"
        inn = "112233445566"
        data = {
            "email": "example@mail.ru",
            "last_name": last_name,
            "first_name": first_name,
            "snils": snils,
            "phone": phone,
            "inn": inn,
        }

        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        response_json = response.json()
        created_user = User.objects.get(username=response_json["username"])
        self.assertEqual(created_user.last_name, last_name)
        self.assertEqual(created_user.first_name, first_name)
        self.assertEqual(Person.objects.filter(user__username=response_json["username"]).exists(), True)
        person = Person.objects.get(user__username=response_json["username"])
        self.assertEqual(person.snils, snils)
        self.assertEqual(person.phone, phone)
        self.assertEqual(person.inn, inn)

    def test_create_user_empty_email(self):
        url = reverse('signup')
        last_name = "test test"
        first_name = "my name"
        snils = "123456789"
        data = {
            "email": "",
            "last_name": last_name,
            "first_name": first_name,
            "snils": snils,
        }

        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        response_json = response.json()
        self.assertEqual({'email': ['This field may not be blank.']}, response_json)

    def test_create_user_empty_last_name(self):
        url = reverse('signup')
        first_name = "my name"
        snils = "123456789"
        data = {
            "email": "a@mail.ru",
            "last_name": "",
            "first_name": first_name,
            "snils": snils,
        }

        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        response_json = response.json()
        self.assertEqual({'last_name': ['This field may not be blank.']}, response_json)

    def test_create_user_empty_first_name(self):
        url = reverse('signup')
        snils = "123456789"
        data = {
            "email": "a@mail.ru",
            "last_name": "last_name",
            "first_name": "",
            "snils": snils,
        }

        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        response_json = response.json()
        self.assertEqual({'first_name': ['This field may not be blank.']}, response_json)

    def test_create_user_empty_snils(self):
        url = reverse('signup')
        data = {
            "email": "a@mail.ru",
            "last_name": "last_name",
            "first_name": "first_name",
            "snils": "",
        }

        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        response_json = response.json()
        self.assertEqual({'snils': ['This field may not be blank.']}, response_json)
