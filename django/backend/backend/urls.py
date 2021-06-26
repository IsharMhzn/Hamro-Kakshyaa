from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('user.urls')),
    path('notes/',include('notes.urls')),
    path('notice/', include('notice.urls')),
    path('classRoutine/',include('classRoutine.urls')),
]