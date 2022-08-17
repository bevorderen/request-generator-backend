from rest_framework import serializers


class SubjectRequestOv(serializers.Serializer):
    commonName = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    organizationName = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    countryName = serializers.CharField(
        min_length=2,
        max_length=2,
    )
    stateOrProvinceName = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    localityName = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    streetAddress = serializers.CharField(
        min_length=1,
        max_length=32768,
    )
    subjectAltName = serializers.ListField(
        child=serializers.CharField(
            min_length=1,
            max_length=32768,
        )
    )


class RequestOv(serializers.Serializer):
    extKeyUsage = serializers.ListField(
        child=serializers.CharField()
    )
    keyUsage = serializers.ListField(
        child=serializers.CharField()
    )
    subject = SubjectRequestOv()
    stock_id = serializers.IntegerField()
