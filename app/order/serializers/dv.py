from rest_framework import serializers


class SubjectRequestDv(serializers.Serializer):
    commonName = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    countryName = serializers.CharField(
        min_length=2,
        max_length=2,
    )
    subjectAltName = serializers.ListField(
        child=serializers.CharField(
            min_length=1,
            max_length=32768,
        )
    )


class RequestDv(serializers.Serializer):
    extKeyUsage = serializers.ListField(
        child=serializers.CharField()
    )
    subject = SubjectRequestDv()
    stock_id = serializers.IntegerField()
