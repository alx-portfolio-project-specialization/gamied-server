from django.urls import path

from assessments.views import AssessmentListAPIView, AssessmentDetailAPIView, QuestionListAPIView, QuestionDetailAPIView, SubmitAssessmentAPIView

urlpatterns = [
    path('', AssessmentListAPIView.as_view(), name='assessments'),
    path('<int:assessment_id>', AssessmentDetailAPIView.as_view(), name='assessment'),
    path('<int:assessment_id>/submit', SubmitAssessmentAPIView.as_view(), name='submit_assessment'),
    path('<int:assessment_id>/questions', QuestionListAPIView.as_view(), name='questions'),
    path('<int:assessment_id>/questions/<int:question_id>', QuestionDetailAPIView.as_view(), name='question'),
]
