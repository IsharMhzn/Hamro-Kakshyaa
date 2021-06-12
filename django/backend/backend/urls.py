from django.contrib import admin
from django.urls import path, include
from user.views import RegisterAPI, LoginAPI
from rest_framework_simplejwt.views import TokenRefreshView


urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', LoginAPI.as_view(), name='login'),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('notes/',include('notes.urls')),
    path('notice/', include('notice.urls')),
    # path('', include('rest_framework.urls')),
    path('register', RegisterAPI.as_view()),
    # path('student', StudentAPI.as_view())
]