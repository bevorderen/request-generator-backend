from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.x509.oid import NameOID
from django.core.exceptions import ObjectDoesNotExist
from rest_framework.authtoken.admin import User
from rest_framework.exceptions import ValidationError

from order.constants import RequestData, DEFAULT_KEY_USAGE, mapping_key_usage
from order.models import Order
from order.serializers.dv import RequestDv
from order.serializers.order import OrderSerializer
from order.serializers.ov import RequestOv
from order.services.certificate import order_create_certificate
from person.models import Person
from stock.constants import StockType
from stock.models import Stock


def order_create(data: dict, user: User):
    try:
        stock = Stock.objects.get(id=data["stock_id"])
    except (KeyError,):
        raise ValidationError({"message": "stock_id required field"})
    except (ObjectDoesNotExist,):
        raise ValidationError({"message": f"{data['stock_id']=} does not exist"})

    try:
        person = Person.objects.get(user__pk=user.pk)
    except (ObjectDoesNotExist,):
        raise ValidationError({"message": f"{user.pk} was removed!"})

    if stock.type == StockType.DV:
        serializer = RequestDv(data=data)
        serializer.is_valid(raise_exception=True)
        request_data: RequestData = order_create_dv_request(request=serializer.validated_data)
    elif stock.type == StockType.OV:
        serializer = RequestOv(data=data)
        serializer.is_valid(raise_exception=True)
        request_data: RequestData = order_create_ov_request(request=serializer.validated_data)
    else:
        raise ValidationError({"message": "Wrong request_type!"})

    order = Order.objects.create(
        certificate_owner=person,
        stock=stock,
        request_data=data,
    )

    order_serializer = OrderSerializer(order)
    response = order_serializer.data
    response.update(request_data)
    certificate = order_create_certificate(data=response)
    response.update(certificate)
    return response


def order_create_ov_request(request: dict) -> RequestData:
    key_usage = dict(DEFAULT_KEY_USAGE)
    key_usage.update({mapping_key_usage[k_u]: True for k_u in request["keyUsage"]})

    key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
    )
    csr = x509.CertificateSigningRequestBuilder().subject_name(x509.Name([
        x509.NameAttribute(NameOID.COUNTRY_NAME, request["subject"]["countryName"]),
        x509.NameAttribute(NameOID.COMMON_NAME, request["subject"]['commonName']),
        x509.NameAttribute(NameOID.ORGANIZATION_NAME, request["subject"]["organizationName"]),
        x509.NameAttribute(NameOID.STATE_OR_PROVINCE_NAME, request["subject"]["stateOrProvinceName"]),
        x509.NameAttribute(NameOID.LOCALITY_NAME, request["subject"]["localityName"]),
        x509.NameAttribute(NameOID.STREET_ADDRESS, request["subject"]["streetAddress"]),
    ])).add_extension(
        x509.SubjectAlternativeName([
            x509.DNSName(value=alt_name.encode('idna').decode('utf-8')) for alt_name in
            request["subject"]["subjectAltName"]
        ]),
        critical=False,
    ).add_extension(
        x509.ExtendedKeyUsage([
            x509.oid.ObjectIdentifier(dotted_string=oid) for oid in request["extKeyUsage"]
        ]),
        critical=False
    ).add_extension(
        x509.KeyUsage(
            **key_usage
        ),
        critical=False
    ).sign(key, hashes.SHA256())

    return {
        "request": csr.public_bytes(serialization.Encoding.PEM).decode("utf-8"),
        "key": key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ).decode("utf-8")
    }


def order_create_dv_request(request: dict) -> RequestData:
    key_usage = dict(DEFAULT_KEY_USAGE)
    key_usage.update({"digital_signature": True, "key_encipherment": True})

    key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
    )
    csr = x509.CertificateSigningRequestBuilder().subject_name(x509.Name([
        x509.NameAttribute(NameOID.COUNTRY_NAME, request["subject"]["countryName"]),
        x509.NameAttribute(NameOID.COMMON_NAME, request["subject"]["commonName"]),
    ])).add_extension(
        x509.SubjectAlternativeName([
            x509.DNSName(value=alt_name.encode('idna').decode('utf-8')) for alt_name in
            request["subject"]["subjectAltName"]
        ]),
        critical=False,
    ).add_extension(
        x509.ExtendedKeyUsage([
            x509.oid.ObjectIdentifier(dotted_string=oid) for oid in request["extKeyUsage"]
        ]),
        critical=False
    ).add_extension(
        x509.KeyUsage(
            **key_usage
        ),
        critical=False
    ).sign(key, hashes.SHA256())

    return {
        "request": csr.public_bytes(serialization.Encoding.PEM).decode("utf-8"),
        "key": key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ).decode("utf-8")
    }
