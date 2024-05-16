from rest_framework import status
from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication

from assessments.models import Question, Assessment, Penalty
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


class SubmitAssessmentAPIView(APIView):
    serializer_class = QuestionSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, assessment_id, *args, **kwargs):
        user = request.user
        answers = request.data.get('answers')
        incorrect = set()
        try:
            assessment = Assessment.objects.get(id=assessment_id)
            questions = assessment.questions.all()
        except Assessment.DoesNotExist:
            return Response({'error': 'Assessment not found'}, status.HTTP_404_NOT_FOUND)
        try:
            answers = {int(k): int(v) for k, v in answers.items()}
            for question in questions:
                correct_answer = question.correct_answer()
                if correct_answer and correct_answer.id != answers.get(question.id):
                    penalty = Penalty.objects.get_or_create(user=user, question=question)
                    penalty.points += .2 * question.points
                    penalty.save()
                    incorrect.add(question.id)
            if not incorrect:
                assessment.lesson.assessment.completed_by.add(user)
            data = [{**QuestionSerializer(question).data, **{'is_correct': question.id not in incorrect}} for question in questions]
            return Response(data, status=status.HTTP_200_OK)
        except:
            return Response({'error': 'Missing or invalid value for key `answers`'}, status=status.HTTP_400_BAD_REQUEST)
