from django.urls import path
from courses.views import CourseListAPIView, LessonListAPIView, CourseDetailAPIView, LessonDetailAPIView

urlpatterns = [
    path('', CourseListAPIView.as_view(), name='courses'),
    path('<int:course_id>', CourseDetailAPIView.as_view(), name='course'),
    path('<int:course_id>/lessons', LessonListAPIView.as_view(), name='lessons'),
    path('<int:course_id>/lessons/<int:lesson_id>', LessonDetailAPIView.as_view(), name='lesson'),
]
