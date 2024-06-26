# Generated by Django 5.0.6 on 2024-05-20 20:27

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('assessments', '0009_assessmentresult_delete_assessmentattempt'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='assessment',
            name='time_allowed',
            field=models.PositiveIntegerField(default=30, verbose_name='Time Allowed (Minutes)'),
        ),
        migrations.AlterField(
            model_name='assessmentresult',
            name='assessment',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='results', to='assessments.assessment'),
        ),
        migrations.AlterField(
            model_name='assessmentresult',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='results', to=settings.AUTH_USER_MODEL),
        ),
    ]
