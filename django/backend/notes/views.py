
from django.shortcuts import render
from . import models
from .serializer import NotesSerializers
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response 
from rest_framework.parsers import FileUploadParser
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.
class ListNotes(generics.ListCreateAPIView):
    serializer_class =  NotesSerializers
    queryset =  models.Notes.objects.all()    
    filter_ackends = [DjangoFilterBackend]
     
    filterset_fields = ['title']
    # def get_queryset(self):
    #     if self.request.user == "student" :
    #         dataFiltered = models.Notes.objects.filter(classcode='xyz')
    #         #having 1 classcode we get access to all the subjects in the classs so we be getting notes of all subjects futher on this later 


    #         return dataFiltered
    




class DetailNotes(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = NotesSerializers
    queryset =  models.Notes.objects.all()


class UploadView(APIView):
    authentiation_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    parser_classes = (FileUploadParser,)
    def post(self,request):
        file = request.data.get('file',None)
        if file:
            file.save()
            return Response({'message' : 'Successful'},status=200)
        else:
             return Response({'message' : 'Unsccessful'},status=400)