from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import extend_schema_field
from rest_framework import serializers
from courses.models import Course, Lesson, ContentLink
from assessments.serializers import DetailedAssessmentSerializer


class ContentLinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContentLink
        fields = ['id', 'title', 'href']


class DetailedLessonSerializer(serializers.ModelSerializer):
    content = ContentLinkSerializer(many=True, read_only=True)
    assessment = DetailedAssessmentSerializer(many=False, read_only=True)
    completed = serializers.SerializerMethodField()

    class Meta:
        model = Lesson
        fields = ['id', 'title', 'completed', 'content', 'assessment']

    @extend_schema_field(OpenApiTypes.BOOL)
    def get_completed(self, obj):
        user = self.context['request'].user
        return obj.completed(user)


class LessonSerializer(DetailedLessonSerializer):

    def to_representation(self, instance):
        res = super().to_representation(instance)
        detail_keys = ['assessment']
        for k in detail_keys:
            del res[k]
        return res


class DetailedCourseSerializer(serializers.ModelSerializer):
    lessons = LessonSerializer(many=True, read_only=True)
    progress = serializers.SerializerMethodField()
    lessons_count = serializers.SerializerMethodField()

    class Meta:
        model = Course
        fields = ['id', 'title', 'description', 'lessons_count', 'progress', 'thumbnail', 'lessons']

    @extend_schema_field(OpenApiTypes.INT)
    def get_lessons_count(self, obj):
        return obj.lessons.count()

    @extend_schema_field(OpenApiTypes.INT)
    def get_progress(self, obj):
        user = self.context['request'].user
        return obj.progress(user)


class CourseSerializer(DetailedCourseSerializer):
    def to_representation(self, instance):
        res = super().to_representation(instance)
        detail_keys = ['lessons']
        for k in detail_keys:
            del res[k]
        return res
