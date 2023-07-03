from django.db import models
from django.contrib.auth.models import AbstractUser

class usuariopersonalizado(AbstractUser):
    suscriptor = models.BooleanField(default=False)

    groups = models.ManyToManyField(
        'auth.Group',
        verbose_name='groups',
        blank=True,
        related_name='usuariopersonalizado_set'
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        verbose_name='user permissions',
        blank=True,
        related_name='usuariopersonalizado_set'
    )

    def str(self):
        return self.username