# Generated by Django 3.2.4 on 2021-06-22 12:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subject', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='classcode',
            name='code',
            field=models.CharField(default='ce18', max_length=10),
        ),
    ]
