
from django.shortcuts import render
from . import models
from .serializer import NotesSerializers

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