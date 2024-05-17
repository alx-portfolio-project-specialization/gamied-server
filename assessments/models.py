from accounts.models import CustomUser
from django.core.exceptions import ValidationError
from django.db import models

from courses.models import Lesson


class Assessment(models.Model):
    title = models.CharField(max_length=255, null=True, blank=True)
    type = models.CharField(choices=[('quiz', 'Quiz'), ('exam', 'Exam')], default='quiz', null=False, blank=False, max_length=50)
    pass_mark = models.PositiveIntegerField('Pass Mark (%)', default=70)
    description = models.TextField(null=True, blank=True)
    thumbnail = models.ImageField(upload_to="assessments/", blank=True, null=True)
    lesson = models.OneToOneField(Lesson, on_delete=models.CASCADE, null=True, blank=True, related_name='assessment')
    completed_by = models.ManyToManyField(CustomUser, related_name='completed_lessons', blank=True)

    def completed(self, user):
        return self.completed_by.filter(id=user.id).exists()

    def __str__(self):
        if self.lesson and self.title:
            return f'{self.lesson} | {self.title}'
        elif self.title:
            return self.title
        else:
            return f'{self.lesson}'

    def clean(self):
        if self.type == 'quiz' and not self.lesson:
            raise ValidationError('A Quiz must be linked to a lesson')
        elif self.type == 'exam':
            if self.lesson:
                raise ValidationError('An exam cannot be linked to a lesson')
            elif not self.title:
                raise ValidationError('An assessment of type exam must have a title')
            elif not self.description:
                raise ValidationError('An assessment of type exam must have a description')
            elif not self.thumbnail:
                raise ValidationError('An assessment of type exam must have a thumbnail')


class AssessmentAttempt(models.Model):
    assessment = models.ForeignKey(Assessment, on_delete=models.CASCADE, null=False, blank=False, related_name='assessment_attempts')
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=False, blank=False)
    score = models.PositiveIntegerField('Score (%)')

    def clean(self):
        if self.assessment.type != 'exam':
            raise ValidationError('You can only record attempts for assessments of type exam')
        if self.score > 100 or self.score < 0:
            raise ValidationError('The provided score score must be between 0 and 100')


class Question(models.Model):
    assessment = models.ForeignKey(Assessment, on_delete=models.CASCADE, null=False, blank=False, related_name='questions')
    name = models.CharField(max_length=255, null=False, blank=False)
    points = models.PositiveIntegerField(default=0)

    def correct_answer(self):
        correct_answers = self.answers.filter(is_correct=True)
        return correct_answers and correct_answers[0]

    def __str__(self):
        return f'{self.assessment} | {self.name}'

    def lost_points(self, user):
        return self.penalties.filter(user=user).aggregate(total_points=models.Sum('points'))['total_points'] or 0


class Answer(models.Model):
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
