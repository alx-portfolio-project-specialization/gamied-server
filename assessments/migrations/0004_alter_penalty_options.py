# Generated by Django 5.0.6 on 2024-05-14 12:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('assessments', '0003_remove_answer_points_question_points'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='penalty',
            options={'verbose_name_plural': 'penalties'},
        ),
    ]