from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import extend_schema_field
from rest_framework import serializers
from courses.models import Course, Lesson, ContentLink
from assessments.serializers import AssessmentSerializer


class ContentLinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContentLink
        fields = ['id', 'title', 'href']


class CourseSerializer(serializers.ModelSerializer):
    progress = serializers.SerializerMethodField()

    class Meta:
        model = Course
        fields = ['id', 'title', 'description', 'progress', 'thumbnail']

    @extend_schema_field(OpenApiTypes.INT)
    def get_progress(self, obj):
        user = self.context['request'].user
        return obj.progress(user)


class LessonSerializer(serializers.ModelSerializer):
    completed = serializers.SerializerMethodField()

    class Meta:
        model = Lesson
        fields = ['id', 'title', 'completed']

    @extend_schema_field(OpenApiTypes.BOOL)
    def get_completed(self, obj):
        user = self.context['request'].user
        return obj.completed(user)


class DetailedCourseSerializer(CourseSerializer):
    lessons = LessonSerializer(many=True, read_only=True)

    class Meta:
        model = Course
        fields = ['id', 'title', 'description', 'progress', 'thumbnail', 'lessons']


class DetailedLessonSerializer(LessonSerializer):
    content = ContentLinkSerializer(many=True, read_only=True)
    assessment = AssessmentSerializer(many=False, read_only=True)

    class Meta:
        model = Lesson
        fields = ['id', 'title', 'completed', 'content', 'assessment']
