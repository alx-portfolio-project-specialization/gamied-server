from django.db import models


class Course(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(blank=True, null=True)
    thumbnail = models.ImageField(upload_to="courses/", blank=True, null=True)

    def __str__(self):
        return self.title


class Lesson(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False)
    course = models.ForeignKey(Course, null=False, on_delete=models.CASCADE)

    def __str__(self):
        return self.title


class ContentLink(models.Model):
    lesson = models.ForeignKey(Lesson, null=False, on_delete=models.CASCADE, related_name='content')
    title = models.CharField(max_length=255, null=False, blank=False)
    href = models.URLField(null=False, blank=False)

    def __str__(self):
        return self.title
