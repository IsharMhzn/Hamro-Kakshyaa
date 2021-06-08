from django.contrib import admin
from django.urls import path, include
from user.views import RegisterAPI

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('notes/',include('notes.urls')),
    path('notice/', include('notice.urls')),
    path('', include('rest_framework.urls')),
    path('', RegisterAPI.as_view())
]