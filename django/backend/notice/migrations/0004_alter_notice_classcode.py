# Generated by Django 3.2.4 on 2021-06-22 12:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('subject', '0001_initial'),
        ('notice', '0003_alter_notice_author'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notice',
            name='classcode',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.CASCADE, to='subject.classcode'),
        ),
    ]
