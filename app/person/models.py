from django.contrib.auth.models import User
from django.db import models


class Person(models.Model):
    last_name = models.CharField(
        verbose_name="Фамилия",
        max_length=255,
    )
    first_name = models.CharField(
        verbose_name="Имя",
        max_length=255,
    )
    middle_name = models.CharField(
        verbose_name="Отчество",
        max_length=255,
        blank=True,
        null=True,
    )
    phone = models.CharField(
        verbose_name="Номер телефона",
        max_length=50,
        null=True,
        blank=True,
    )
    snils = models.CharField(
        verbose_name="СНИЛС",
        max_length=50,
    )
    inn = models.CharField(
        verbose_name="ИНН физического лица",
        max_length=12,
        null=True,
        blank=True,
    )
    user = models.OneToOneField(
        to=User,
        on_delete=models.CASCADE
    )

    @property
    def fio(self):
        return f"{self.last_name} {self.first_name} {self.middle_name if self.middle_name else ''}".strip()

    def __str__(self):
        return f"{self.pk} {self.fio}"
