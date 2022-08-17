from random import choice
from string import ascii_lowercase, digits

from django.contrib.auth.models import User

from person.constants import CreatedPerson
from person.models import Person


def generate_random_username(length=4, chars=ascii_lowercase + digits, split=4, delimiter='-'):
    username = ''.join([choice(chars) for _ in range(length)])

    if split:
        username = delimiter.join([username[start:start + split] for start in range(0, len(username), split)])

    try:
        User.objects.get(username=username)
        return generate_random_username(length=length, chars=chars, split=split, delimiter=delimiter)
    except User.DoesNotExist:
        return username


def person_create(data: dict) -> CreatedPerson:
    password = User.objects.make_random_password(length=8)
    user = User.objects.create_user(
        username=generate_random_username(),
        email=data["email"],
        password=password,
        first_name=data["first_name"],
        last_name=data["last_name"],
    )

    Person.objects.create(
        last_name=data["last_name"],
        first_name=data["first_name"],
        middle_name=data["middle_name"] if "middle_name" in data else None,
        phone=data["phone"] if "phone" in data else None,
        snils=data["snils"],
        inn=data["inn"] if "inn" in data else None,
        user=user,
    )

    return CreatedPerson(username=user.username, password=password)
