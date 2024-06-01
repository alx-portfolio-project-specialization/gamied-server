from django.contrib import admin
from django.forms.models import inlineformset_factory

from assessments.models import Assessment, Question, Answer, Penalty

QuestionFormSet = inlineformset_factory(
    Assessment,
    Question,
    fields=['name', 'assessment', 'points'],
    can_delete=True
)
AnswerFormSet = inlineformset_factory(
    Question,
    Answer,
    fields=['name', 'question', 'is_correct'],
    can_delete=True
)


class QuestionInline(admin.TabularInline):
    model = Question
    formset = QuestionFormSet
    extra = 0


class AnswerInline(admin.TabularInline):
    model = Answer
    extra = 0


@admin.register(Assessment)
class AssessmentAdmin(admin.ModelAdmin):
    inlines = [QuestionInline]
    readonly_fields = ['completed_by']


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    inlines = [AnswerInline]
    list_display = ('name', 'assessment', 'points')
    list_filter = ('assessment',)


@admin.register(Answer)
class AnswerAdmin(admin.ModelAdmin):
    list_display = ('name', 'question', 'is_correct')
    list_filter = ('question', 'is_correct')


@admin.register(Penalty)
class PenaltyAdmin(admin.ModelAdmin):
    list_display = ('user', 'question', 'points')
    readonly_fields = ('user', 'question', 'points')
    list_filter = ('user', 'question')

    def has_add_permission(self, request):
        # Disable the ability to add new penalties
        return False

    def has_change_permission(self, request, obj=None):
        # Disable the ability to change existing penalties
        return False

    # def has_delete_permission(self, request, obj=None):
    #     # Disable the ability to delete existing penalties
    #     return False

