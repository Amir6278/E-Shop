# Generated by Django 4.2.3 on 2023-07-17 14:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0002_user_profile_delete_user_rofile'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user_profile',
            name='img',
            field=models.ImageField(upload_to='Image/'),
        ),
        migrations.AlterField(
            model_name='user_profile',
            name='number',
            field=models.CharField(max_length=20),
        ),
    ]
