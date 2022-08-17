from django.db import transaction
from rest_framework import serializers
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from common.views import ApiErrorsMixin
from person.constants import CreatedPerson
from person.models import Person
from person.services import person_create


class SignUpApi(ApiErrorsMixin, APIView):
    class SignUpInputSerializer(serializers.ModelSerializer):
        email = serializers.CharField(required=True)

        class Meta:
            model = Person
            exclude = ["user"]

    class SignUpOutputSerializer(serializers.Serializer):
        username = serializers.CharField(required=True)
        password = serializers.CharField(required=True)

    @transaction.atomic
    def post(self, request: Request):
        serializer = self.SignUpInputSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        person: CreatedPerson = person_create(data=serializer.validated_data)
        return Response(data=self.SignUpOutputSerializer(person).data)
