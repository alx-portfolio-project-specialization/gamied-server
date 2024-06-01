from rest_framework_simplejwt.authentication import JWTAuthentication

from courses.models import Course
from courses.serializers import CourseSerializer, LessonSerializer, DetailedLessonSerializer, DetailedCourseSerializer
from drf_spectacular.utils import extend_schema, OpenApiExample
from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated


@extend_schema(examples=[OpenApiExample(
    'Response Example',
    {
        "id": 1,
        "title": "string",
        "description": "string",
        "lessons_count": 5,
        "progress": 25,
        "thumbnail": "string"
    },
    response_only=True, )
])
class CourseListAPIView(ListAPIView):
    """Returns a brief list of all available courses"""
    queryset = Course.objects.all()
    serializer_class = CourseSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]


@extend_schema(examples=[OpenApiExample(
    'Response Example',
    {
        "id": 16,
        "title": "string",
        "description": "string",
        "lessons_count": 1,
        "progress": 100,
        "thumbnail": "string",
        "lessons": [
            {
                "id": 12,
                "title": "string",
                "completed": True
            }
        ]
    },
    response_only=True, )
])
class CourseDetailAPIView(RetrieveAPIView):
    """Returns a detailed course object with a brief list of lessons"""
    queryset = Course.objects.all()
    serializer_class = DetailedCourseSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'course_id'


@extend_schema(examples=[OpenApiExample(
    'Response Example',
    {
        "id": 6,
        "title": "string",
        "completed": True
    },
    response_only=True)
])
class LessonListAPIView(ListAPIView):
    """Returns a brief list of lessons of a particular  course"""
    serializer_class = LessonSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        course_id = self.kwargs.get('course_id')
        try:
            course = Course.objects.get(pk=course_id)
            return course.lessons.all()
        except Course.DoesNotExist:
            return


@extend_schema(examples=[OpenApiExample(
    'Response Example',
    {
        "id": 12,
        "title": "string",
        "completed": False,
        "content": [
            {
                "id": 4,
                "title": "Data Structures",
                "href": "https://en.wikipedia.org/wiki/Data_structure"
            }
        ],
        "assessment": {
            "id": 7,
            "completed": False,
            "questions": [
                {
                    "id": 14,
                    "name": "string",
                    "points": 60,
                    "answers": [
                        {
                            "id": 32,
                            "name": "string",
                            "is_correct": False
                        },
                        {
                            "id": 33,
                            "name": "string",
                            "is_correct": True
                        }
                    ],
                    "lost_points": 0
                }
            ],
        }
    },
    response_only=True)
])
class LessonDetailAPIView(RetrieveAPIView):
    """Returns a detailed lesson object which includes content links and info about the related assessment (assessment questions and answers)\n
    Note: unlike a standalone assessment/exam, an assessment attached to a lesson only has the following properties: ['id', 'completed', 'questions']
    """
    serializer_class = DetailedLessonSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'lesson_id'

    def get_queryset(self):
        course_id = self.kwargs.get('course_id')
        try:
            course = Course.objects.get(pk=course_id)
            return course.lessons.all()
        except Course.DoesNotExist:
            return
