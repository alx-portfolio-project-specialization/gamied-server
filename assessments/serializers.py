from assessments.models import Assessment, Question, Answer
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import extend_schema_field
from rest_framework import serializers


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'name', 'is_correct']


class QuestionSerializer(serializers.ModelSerializer):
    answers = AnswerSerializer(many=True, read_only=True)
    lost_points = serializers.SerializerMethodField()

    class Meta:
        model = Question
        fields = ['id', 'name', 'points', 'answers', 'lost_points']

    @extend_schema_field(OpenApiTypes.INT)
    def get_lost_points(self, obj):
        user = self.context['request'].user
        return obj.lost_points(user)


class AssessmentSerializer(serializers.ModelSerializer):
    questions = QuestionSerializer(many=True, read_only=True)
    completed = serializers.SerializerMethodField()
    result = serializers.SerializerMethodField()

    class Meta:
        model = Assessment
        fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'completed', 'result', 'questions', 'time_allowed']

    @extend_schema_field(OpenApiTypes.BOOL)
    def get_completed(self, obj):
        user = self.context['request'].user
        return obj.completed(user)

    @extend_schema_field(OpenApiTypes.OBJECT)
    def get_result(self, obj):
        user = self.context['request'].user
        return obj.result(user)

    def to_representation(self, instance):
        res = super().to_representation(instance)
        if instance.type == 'exam':
            fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'result', 'time_allowed']
        else:
            fields = ['id', 'completed']
        return {k: v for k, v in res.items() if k in fields}


class DetailedAssessmentSerializer(AssessmentSerializer):
    class Meta:
        model = Assessment
        fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'completed', 'result', 'time_allowed', 'questions']

    def to_representation(self, instance):
        res = super().to_representation(instance)
        if instance.type == 'exam':
            fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'result', 'time_allowed', 'questions']
        else:
            fields = ['id', 'completed', 'questions']
        return {k: v for k, v in res.items() if k in fields}


class AnswersSerializer(serializers.Serializer):
    answers = serializers.DictField(
        child=serializers.IntegerField(),
        help_text="Dictionary where the key is the question_id and the value is the answer_id, both must be integers greater than 0"
    )
