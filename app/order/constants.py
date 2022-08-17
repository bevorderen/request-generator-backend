from typing import TypedDict, List


class RequestData(TypedDict):
    request: str
    key: str


DEFAULT_KEY_USAGE = {
    "digital_signature": False,
    "content_commitment": False,
    "key_encipherment": False,
    "data_encipherment": False,
    "key_agreement": False,
    "key_cert_sign": False,
    "crl_sign": False,
    "encipher_only": False,
    "decipher_only": False,
}

mapping_key_usage = {
    "digitalSignature": "digital_signature",
    "contentCommitment": "content_commitment",
    "keyEncipherment": "key_encipherment",
    "dataEncipherment": "data_encipherment",
    "keyAgreement": "key_agreement",
    "keyCertSign": "key_cert_sign",
    "crlSign": "crl_sign",
    "encipherOnly": "encipher_only",
    "decipherOnly": "decipher_only",
}


class RequestDVSubject(TypedDict):
    commonName: str
    countryName: str
    subjectAltName: str


class RequestDV(TypedDict):
    extKeyUsage: List[str]
    subject: RequestDVSubject
