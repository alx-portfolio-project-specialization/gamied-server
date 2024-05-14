from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from courses.models import Course, Lesson
from courses.serializers import CourseSerializer, LessonSerializer, DetailedLessonSerializer, DetailedCourseSerializer


class CourseListAPIView(ListAPIView):
    queryset = Course.objects.all()
    serializer_class = CourseSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]


class LessonListAPIView(ListAPIView):
    serializer_class = LessonSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        # Retrieve the course_id from URL parameters
        course_id = self.kwargs.get('course_id')
        try:
            course = Course.objects.get(pk=course_id)
            # Filter queryset based on the course_id
            return Lesson.objects.filter(course=course)
        except Course.DoesNotExist:
            return


class CourseDetailAPIView(RetrieveAPIView):
    queryset = Course.objects.all()
    serializer_class = DetailedCourseSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'course_id'


class LessonDetailAPIView(RetrieveAPIView):
    queryset = Lesson.objects.all()
    serializer_class = DetailedLessonSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'lesson_id'
