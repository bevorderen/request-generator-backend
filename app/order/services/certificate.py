import datetime

from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from cryptography.x509 import Extension


def order_create_certificate(data: dict):
    csr = x509.load_pem_x509_csr(data["request"].encode())
    key = load_pem_private_key(data["key"].encode(), password=None)

    cert_builder = x509.CertificateBuilder().subject_name(
        csr.subject
    ).issuer_name(
        csr.subject
    ).public_key(
        key.public_key()
    ).serial_number(
        x509.random_serial_number()
    ).not_valid_before(
        datetime.datetime.utcnow()
    ).not_valid_after(
        datetime.datetime.utcnow() + datetime.timedelta(days=365)
    )

    for extension in csr.extensions:
        extension: Extension
        cert_builder.add_extension(
            extension.value,
            critical=extension.critical
        )
    cert = cert_builder.sign(private_key=key, algorithm=hashes.SHA256())

    return {
        "certificate": cert.public_bytes(encoding=serialization.Encoding.PEM,)
    }
