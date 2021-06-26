from django.urls import path 
from .views import *

urlpatterns =[
    path('',ListClassRoutine.as_view()),
    path('<int:pk>/',ClassRoutineDetail.as_view()),

]
 