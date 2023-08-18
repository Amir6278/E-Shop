# Generated by Django 4.1 on 2022-09-18 09:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Attribute',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('description', models.TextField(choices=[('size', 'size'), ('color', 'color')])),
            ],
        ),
        migrations.CreateModel(
            name='AttributeValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.CharField(max_length=60)),
                ('attribute', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='AttributeKey', to='shop.attribute')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', models.SlugField()),
                ('is_active', models.BooleanField()),
            ],
            options={
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Inventory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, null=True)),
                ('des', models.TextField(default='Good Quality')),
                ('is_active', models.BooleanField()),
                ('is_default', models.BooleanField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=20)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('attribute', models.ManyToManyField(to='shop.attributevalue')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.category')),
            ],
            options={
                'verbose_name_plural': 'inventory',
            },
        ),
        migrations.CreateModel(
            name='StockControl',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_checked', models.DateTimeField(auto_now_add=True)),
                ('units', models.IntegerField()),
                ('Inventory', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='stock', to='shop.inventory')),
            ],
            options={
                'verbose_name_plural': 'Stock',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=70)),
                ('description', models.TextField()),
                ('slug', models.SlugField()),
                ('is_active', models.BooleanField()),
                ('category', models.ManyToManyField(to='shop.category')),
            ],
        ),
        migrations.AddField(
            model_name='inventory',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='productType', to='shop.product'),
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url', models.ImageField(upload_to='Image')),
                ('alternattext', models.CharField(max_length=50, null=True)),
                ('is_feature', models.BooleanField()),
                ('inventory', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ImgUrl', to='shop.inventory')),
            ],
        ),
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('size', models.CharField(max_length=11)),
                ('color', models.CharField(max_length=11)),
                ('quantity', models.IntegerField(default=1)),
                ('inventory', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.inventory')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
