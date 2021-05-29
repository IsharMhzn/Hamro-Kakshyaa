# Generated by Django 3.2.3 on 2021-05-29 09:22

import django.core.validators
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Notes',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_posted', models.DateTimeField(default=django.utils.timezone.now)),
                ('posted_By', models.CharField(max_length=100)),
                ('description', models.TextField()),
                ('title', models.CharField(max_length=100)),
                ('file', models.FileField(upload_to='documents/', validators=[django.core.validators.FileExtensionValidator(allowed_extensions=['pdf', 'doc', 'ppt', 'xlsx'])])),
            ],
        ),
    ]
