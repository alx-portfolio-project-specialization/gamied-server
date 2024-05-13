from django.contrib import admin
from django.forms.models import inlineformset_factory

from .models import Course, Lesson, ContentLink

LessonFormSet = inlineformset_factory(
    Course,
    Lesson,
    fields=['title'],
    can_delete=True
)
ContentLinkFormSet = inlineformset_factory(
    Lesson,
    ContentLink,
    fields=['title', 'href'],
    can_delete=True
)


class LessonInline(admin.TabularInline):
    model = Lesson
    formset = LessonFormSet
    extra = 0
    readonly_fields = ['completed_by']
    fields = ['title']


class ContentLinkInline(admin.TabularInline):
    model = ContentLink
    extra = 0


@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    inlines = [LessonInline]


@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    inlines = [ContentLinkInline]
    readonly_fields = ['completed_by']
    list_display = ['title', 'course']
    list_filter = ['course']


@admin.register(ContentLink)
class ContentLinkAdmin(admin.ModelAdmin):
    fields = ['lesson', 'title', 'href']
    list_display = ['title', 'href']
    list_filter = ['lesson']
