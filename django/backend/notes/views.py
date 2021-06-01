
from django.shortcuts import render
from . import models
from .serializer import NotesSerializers

from rest_framework import generics

# Create your views here.
class ListNotes(generics.ListCreateAPIView):
    serializer_class =  NotesSerializers
    queryset =  models.Notes.objects.all()    





class DetailNotes(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = NotesSerializers
    queryset =  models.Notes.objects.all()