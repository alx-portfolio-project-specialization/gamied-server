from accounts.models import CustomUser
from django.core.exceptions import ValidationError
from django.db import models

from courses.models import Lesson


class Assessment(models.Model):
    title = models.CharField(max_length=255, null=True, blank=True)
    lesson = models.OneToOneField(Lesson, on_delete=models.CASCADE, null=True, blank=True, related_name='assessment')

    def __str__(self):
        return f'{self.lesson} | {self.title}'

    def clean(self):
        if not self.lesson and not self.title:
            raise ValidationError({'title': 'Title is required when an assessment is not linked to a lesson'})


class Question(models.Model):
    assessment = models.ForeignKey(Assessment, on_delete=models.CASCADE, null=False, blank=False, related_name='questions')
    name = models.CharField(max_length=255, null=False, blank=False)
    points = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f'{self.assessment} | {self.name}'

    def lost_points(self, user):
        return self.penalties.filter(user=user).aggregate(total_points=models.Sum('points'))['total_points'] or 0


class Answer(models.Model):
    class Meta:
        # Ensure that only one answer can be marked as correct for a question
        unique_together = ('question', 'is_correct')

    question = models.ForeignKey(Question, on_delete=models.CASCADE, null=False, blank=False, related_name='answers')
    name = models.CharField(max_length=255, null=False, blank=False)
    is_correct = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.question} | {self.name}'

    def clean(self):
        # Ensure that only one answer can be marked as correct
        if self.is_correct:
            other_correct_answers = self.question.answers.filter(is_correct=True).exclude(pk=self.pk)
            if other_correct_answers.exists():
                raise ValidationError("Only one answer can be marked as correct.")


class Penalty(models.Model):
    class Meta:
        unique_together = ('user', 'question')
        verbose_name_plural = 'penalties'

    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=False, blank=False, related_name='penalties')
    question = models.ForeignKey(Question, on_delete=models.CASCADE, null=False, blank=False, related_name='penalties')
    points = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.user} | {self.question} | {self.points}'
