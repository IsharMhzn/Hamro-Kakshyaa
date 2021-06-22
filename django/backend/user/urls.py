from django.urls import path
from user.views import RegisterAPI, LoginAPI, UserAPI, StudentAPI, TeacherAPI
from rest_framework_simplejwt.views import TokenRefreshView


urlpatterns = [
    path('register/', RegisterAPI.as_view(), name='register'),
    path('login/', LoginAPI.as_view(), name='login'),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('user/', UserAPI.as_view(), name='homepage'),
    path('student/<int:user>/', StudentAPI.as_view(), name='student homepage'),
    path('teacher/<int:user>', TeacherAPI.as_view(), name='teacher homepage'),
]