from django.db.models import Sum
from rest_framework import status
from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.authentication import JWTAuthentication

from assessments.models import Question, Assessment, Penalty, AssessmentResult
from assessments.serializers import QuestionSerializer, AssessmentSerializer, AnswersSerializer, DetailedAssessmentSerializer
from drf_spectacular.utils import extend_schema, OpenApiParameter, OpenApiExample


@extend_schema(examples=[OpenApiExample('Response Example', {
    "id": 1,
    "title": "string",
    "pass_mark": 70,
    "description": "string",
    "thumbnail": "string",
    "completed": True,
    "result": {'score': 80, 'comment': 'Passed'},
    "time_allowed": 60
}, response_only=True)
                         ])
class AssessmentListAPIView(ListAPIView):
    """Returns all assessments of type 'exam'"""
    queryset = Assessment.objects.filter(type='exam')
    serializer_class = AssessmentSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]


@extend_schema(examples=[OpenApiExample('Response Example', {
    "id": 1,
    "title": "string",
    "pass_mark": 70,
    "description": "string",
    "thumbnail": "string",
    "completed": False,
    "result": {'score': -1, 'comment': 'Not Started'},
    "time_allowed": 60,
    "questions": [
        {
            "id": 1,
            "name": "string",
            "points": 40,
            "answers": [
                {
                    "id": 1,
                    "name": "string",
                    "is_correct": True
                },
                {
                    "id": 2,
                    "name": "string",
                    "is_correct": False
                },
            ],
            "lost_points": 0
        }
    ],
}, response_only=True)
                         ])
class AssessmentDetailAPIView(RetrieveAPIView):
    """Retrieves a specific assessment. Returned properties will vary depending on assessment type.\n
    For Assessment of type exam you get: ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'result', 'questions', 'time_allowed'].\n
    For Assessment of type quiz you get: ['id', 'completed', 'questions']
    """
    queryset = Assessment.objects.all()
    serializer_class = DetailedAssessmentSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'assessment_id'


@extend_schema(examples=[OpenApiExample('Response Example', {
    "id": 16,
    "name": "string",
    "points": 40,
    "answers": [
        {
            "id": 1,
            "name": "string",
            "is_correct": True
        },
        {
            "id": 2,
            "name": "string",
            "is_correct": False
        }
    ],
    "lost_points": 0
}, response_only=True)])
class QuestionListAPIView(ListAPIView):
    """Takes in an assessment id and returns all questions linked to the assessment"""
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


@extend_schema(examples=[OpenApiExample('Response Example', {
    "id": 16,
    "name": "string",
    "points": 40,
    "answers": [
        {
            "id": 1,
            "name": "string",
            "is_correct": True
        },
        {
            "id": 2,
            "name": "string",
            "is_correct": False
        }
    ],
    "lost_points": 0
}, response_only=True)])
class QuestionDetailAPIView(RetrieveAPIView):
    """Retrieves a question object. The question must be linked to the specified assessment_id"""
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
    """Handles submission of assessments of both type (exam and quiz). \n
    Expects a parameter named answers in the request body  representing the chosen answer for each question\n
    Returns an assessment object. Response properties might be different based on assessment type\n
    For Assessment of type exam you get: ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'result', 'questions', 'time_allowed'].\n
    For Assessment of type quiz you get: ['id', 'completed', 'questions']
    """
    serializer_class = AssessmentSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    @extend_schema(
        parameters=[
            OpenApiParameter(name='assessment_id',
                             description='Id of the assessment being submitted',
                             required=True,
                             type=int,
                             location=OpenApiParameter.PATH),
        ],
        request=AnswersSerializer,
        examples=[
            OpenApiExample(
                "Request Example",
                value={
                    "answers": {
                        1: 15,
                        2: 35
                    }
                },
                request_only=True,
                description="Dictionary where the key is the question_id and the value is the answer_id, both must be integers greater than 0",
            ),
            OpenApiExample('Response Example', {
                "id": 1,
                "title": "string",
                "pass_mark": 70,
                "description": "string",
                "thumbnail": "string",
                "completed": True,
                "result": {'score': 80, 'comment': 'Passed'},
                "questions": [
                    {
                        "id": 1,
                        "name": "string",
                        "points": 40,
                        "answers": [
                            {
                                "id": 1,
                                "name": "string",
                                "is_correct": True
                            },
                            {
                                "id": 2,
                                "name": "string",
                                "is_correct": False
                            },
                        ],
                        "lost_points": 0
                    }
                ],
                "time_allowed": 60
            }, response_only=True)
        ],

    )
    def post(self, request, assessment_id, *args, **kwargs):
        user = request.user
        answers = request.data.get('answers')
        incorrect = set()
        lost_points = 0
        passed = False
        try:
            assessment = Assessment.objects.get(id=assessment_id)
            questions = assessment.questions.all()
            is_exam = assessment.type == 'exam'
        except Assessment.DoesNotExist:
            return Response({'error': 'Assessment not found'}, status.HTTP_404_NOT_FOUND)
        try:
            answers = {int(k): int(v) for k, v in answers.items()}
            not_started = is_exam and assessment.result(user)['score'] == -1
            if not assessment.completed(user) or not_started:
                for question in questions:
                    correct_answer = question.correct_answer()
                    if correct_answer and correct_answer.id != answers.get(question.id):
                        if not is_exam:
                            penalty, created = Penalty.objects.get_or_create(user=user, question=question)
                            penalty.points += round(.2 * (question.points - penalty.points))  # Deduct 20% of remaining points
                            penalty.save()
                        else:
                            lost_points += question.points
                        incorrect.add(question.id)
                if is_exam:
                    total_points = assessment.total_points()
                    score = round((total_points - lost_points) / (total_points or 1) * 100)
                    time_taken = int(request.data.get('time_taken', assessment.time_allowed))
                    AssessmentResult.objects.update_or_create(defaults={'score': score, 'time_taken': time_taken}, user=user, assessment=assessment)
                    passed = score >= assessment.pass_mark
                if (is_exam and passed) or (not is_exam and not incorrect):  # They passed exam or got all the quiz right
                    assessment.completed_by.add(user)
            # Recalculate user points
            if assessment.completed(user):
                max_points = Question.objects.filter(assessment__completed_by=user).aggregate(total=Sum('points'))['total'] or 0
                penalties = Penalty.objects.filter(user=user, question__assessment__completed_by=user).aggregate(total=Sum('points'))['total'] or 0
                user.points = max_points - penalties
                user.save()
            data = DetailedAssessmentSerializer(assessment, context={'request': request}).data
            return Response(data, status=status.HTTP_200_OK)
        except:
            return Response({'error': 'Missing or invalid value for key `answers`'}, status=status.HTTP_400_BAD_REQUEST)
