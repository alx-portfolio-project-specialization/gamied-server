from django.db import models

from accounts.models import CustomUser


class Course(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(blank=True, null=True)
    thumbnail = models.ImageField(upload_to="courses/", blank=True, null=True)

    def __str__(self):
        return self.title

    def progress(self, user):
        completed_lessons_count = self.lessons.filter(completed_by=user).count()
        total_lessons_count = self.lessons.count()
        if total_lessons_count == 0:
            return 0  # Handle the case where there are no lessons in the course
        return round((completed_lessons_count / total_lessons_count) * 100)


class Lesson(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False)
    course = models.ForeignKey(Course, null=False, on_delete=models.CASCADE, related_name='lessons')
    completed_by = models.ManyToManyField(CustomUser, related_name='completed_lessons', blank=True)

    def __str__(self):
        return f'{self.course} | {self.title}'

    def completed(self, user):
        return self.completed_by.filter(id=user.id).exists()


class ContentLink(models.Model):
    lesson = models.ForeignKey(Lesson, null=False, on_delete=models.CASCADE, related_name='content')
    title = models.CharField(max_length=255, null=False, blank=False)
    href = models.URLField(null=False, blank=False)

    def __str__(self):
        return f'{self.lesson} | {self.title}'
