from rest_framework import serializers

from assessments.models import Assessment, Question, Answer


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
    completed = serializers.SerializerMethodField()
    result = serializers.SerializerMethodField()

    class Meta:
        model = Assessment
        fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'completed', 'result', 'questions', 'time_allowed']

    def get_completed(self, obj):
        user = self.context['request'].user
        return obj.completed(user)

    def get_result(self, obj):
        user = self.context['request'].user
        return obj.result(user)

    def to_representation(self, instance):
        res = super().to_representation(instance)
        if instance.type == 'exam':
            fields = ['id', 'title', 'pass_mark', 'description', 'thumbnail', 'result', 'questions', 'time_allowed']
        else:
            fields = ['id', 'completed', 'questions']
        return {k: v for k, v in res.items() if k in fields}
