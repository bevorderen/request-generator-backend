from django.db import models

from person.models import Person
from stock.models import Stock


class Order(models.Model):
    certificate_owner = models.ForeignKey(
        to=Person,
        verbose_name="Владелец сертификата",
        on_delete=models.CASCADE,
    )
    stock = models.ForeignKey(
        to=Stock,
        verbose_name="Услуга",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    created = models.DateTimeField(verbose_name="Дата создания", auto_now_add=True)
    updated = models.DateTimeField(verbose_name="Дата изменения", auto_now=True)
    request_data = models.JSONField(
        verbose_name="Данные запроса на сертификат",
        blank=True,
        null=True,
    )
