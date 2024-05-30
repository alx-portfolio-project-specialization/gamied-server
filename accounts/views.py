from drf_spectacular.utils import extend_schema, OpenApiExample

from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from accounts.serializers import CustomUserSerializer


class UserDetailAPIView(APIView):
    """Returns details about the user calling the API"""
    serializer_class = CustomUserSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    @extend_schema(examples=[OpenApiExample(
        'Response Example',
        {
            "id": 1,
            "email": "johndoe@gmail.com",
            "name": "John Doe",
            "points": 116,
            "rank": "Novice"
        },
        response_only=True, )
    ])
    def get(self, request):
        user = request.user
        serializer = CustomUserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)
