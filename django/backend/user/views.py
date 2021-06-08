from rest_framework import generics, permissions, viewsets
from rest_framework.response import Response
from .models import Student, Teacher, User
from .serializers import StudentSerializer, UserSerializer, RegisterSerializer, LoginSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


# Create your views here.
class RegisterAPI(generics.GenericAPIView):
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception = True)
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context = self.get_serializer_context()).data,
        })

class LoginAPI(TokenObtainPairView):
    serializer_class = LoginSerializer

