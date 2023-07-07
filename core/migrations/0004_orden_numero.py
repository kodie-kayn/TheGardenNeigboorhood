# Generated by Django 3.1.2 on 2023-07-07 01:15

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20230706_2105'),
    ]

    operations = [
        migrations.AddField(
            model_name='orden',
            name='numero',
            field=models.CharField(default=uuid.uuid4, max_length=36, unique=True),
        ),
    ]
