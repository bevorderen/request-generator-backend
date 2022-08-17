from django.db import models


# Create your models here.
from stock.constants import StockType


class Stock(models.Model):
    type = models.CharField(
        verbose_name="Тип сертификата",
        max_length=255,
        choices=StockType.TYPES.items(),
        default=StockType.Personal,
    )
    title = models.CharField(
        verbose_name="Название",
        max_length=255
    )
    description = models.TextField(
        verbose_name="Полное описание",
        max_length=255,

    )
    short_description = models.TextField(
        verbose_name="Короткое описание",
        max_length=45,
        blank=True,
        null=True,
    )
    price = models.IntegerField(
        verbose_name="Стоимость",
    )
    discount = models.IntegerField(
        verbose_name="Скидка",
        default=0,
    )

    def __str__(self):
        return f"{self.pk} {self.title}"
