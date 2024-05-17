# Generated by Django 5.0.6 on 2024-05-17 20:32

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('assessments', '0007_alter_answer_unique_together'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='assessment',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='assessment',
            name='pass_mark',
            field=models.PositiveIntegerField(default=70, verbose_name='Pass Mark (%)'),
        ),
        migrations.AddField(
            model_name='assessment',
            name='thumbnail',
            field=models.ImageField(blank=True, null=True, upload_to='assessments/'),
        ),
        migrations.AddField(
            model_name='assessment',
            name='type',
            field=models.CharField(choices=[('quiz', 'Quiz'), ('exam', 'Exam')], default='quiz', max_length=50),
        ),
        migrations.CreateModel(
            name='AssessmentAttempt',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('score', models.PositiveIntegerField(verbose_name='Score (%)')),
                ('assessment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='assessment_attempts', to='assessments.assessment')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]