from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from assessments.models import Question, Assessment
from assessments.serializers import QuestionSerializer, AssessmentSerializer


class AssessmentListAPIView(ListAPIView):
    queryset = Assessment.objects.filter(lesson__isnull=True)
    serializer_class = AssessmentSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]


class AssessmentDetailAPIView(RetrieveAPIView):
    queryset = Assessment.objects.all()
    serializer_class = AssessmentSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'assessment_id'


class QuestionListAPIView(ListAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        assessment_id = self.kwargs.get('assessment_id')
        try:
            assessment = Assessment.objects.get(pk=assessment_id)
            return assessment.questions.all()
        except Assessment.DoesNotExist:
            return


class QuestionDetailAPIView(RetrieveAPIView):
    serializer_class = QuestionSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'question_id'

    def get_queryset(self):
        assessment_id = self.kwargs.get('assessment_id')
        try:
            assessment = Assessment.objects.get(pk=assessment_id)
            return assessment.questions.all()
        except Assessment.DoesNotExist:
            return
