# Generated by Django 4.2.3 on 2023-08-12 12:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tenant', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='client',
            name='on_trial',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='client',
            name='paid_until',
            field=models.DateField(auto_now_add=True),
        ),
    ]
