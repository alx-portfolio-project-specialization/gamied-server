from django.db import models


class Course(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(blank=True, null=True)
    thumbnail = models.ImageField(upload_to="courses/", blank=True, null=True)

    def __str__(self):
        return self.title
