from rest_framework import serializers
from assessments.models import Assessment, Question, Answer, Penalty


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

    def get_lost_points(self, obj):
        user = self.context['request'].user
        return obj.lost_points(user)


class AssessmentSerializer(serializers.ModelSerializer):
    questions = QuestionSerializer(many=True, read_only=True)

    class Meta:
        model = Assessment
        fields = ['id', 'title', 'questions']
