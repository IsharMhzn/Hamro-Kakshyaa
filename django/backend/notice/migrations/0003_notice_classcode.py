# Generated by Django 3.2.3 on 2021-06-05 07:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notice', '0002_alter_notice_date_posted'),
    ]

    operations = [
        migrations.AddField(
            model_name='notice',
            name='classcode',
            field=models.CharField(default='CE18', max_length=10),
        ),
    ]
