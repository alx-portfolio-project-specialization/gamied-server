# Generated by Django 5.0.6 on 2024-05-16 19:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_lesson_completed_by_alter_lesson_course'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='lesson',
            name='completed_by',
        ),
    ]
