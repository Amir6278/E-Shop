# Generated by Django 4.2.3 on 2023-08-20 18:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0006_alter_order_status'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='inventory',
            options={'verbose_name_plural': 'Products'},
        ),
        migrations.AlterModelOptions(
            name='product',
            options={'verbose_name_plural': 'Sub-Categories'},
        ),
    ]
