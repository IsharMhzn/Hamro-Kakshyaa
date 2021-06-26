from django.shortcuts import render
from .serializer import ClassRoutineSerializer
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response 
from subject.models import ClassCode
from .models import classRoutine

# Create your views here.

class ListClassRoutine(generics.ListCreateAPIView):
    serializer_class = ClassRoutineSerializer
    def get_queryset(self):
        user = self.request.user
        if user.is_student:
            faculty =  user.faculty
            batch = user.student.batch

            classcode = ClassCode.objects.get(batch=batch, faculty=faculty)

            objects = classRoutine.objects.filter(classcode = classcode)
            return objects

        elif user.is_teacher:
            objects =  classRoutine.objects.filter(teacher = user)
            return objects
       



class ClassRoutineDetail(generics.RetrieveUpdateDestroyAPIView):
 serializer_class = ClassRoutineSerializer
 queryset  = classRoutine.objects.all() 


