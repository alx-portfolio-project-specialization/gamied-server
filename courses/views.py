from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from courses.models import Course
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
        course_id = self.kwargs.get('course_id')
        try:
            course = Course.objects.get(pk=course_id)
            return course.lessons.all()
        except Course.DoesNotExist:
            return


class CourseDetailAPIView(RetrieveAPIView):
    queryset = Course.objects.all()
    serializer_class = DetailedCourseSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'course_id'


class LessonDetailAPIView(RetrieveAPIView):
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
