# Generated by Django 3.2.3 on 2021-08-02 12:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classRoutine', '0002_auto_20210802_1038'),
    ]

    operations = [
        migrations.AlterField(
            model_name='classroutine',
            name='days',
            field=models.CharField(max_length=200),
        ),
    ]