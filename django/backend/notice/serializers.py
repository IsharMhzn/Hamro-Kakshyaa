from django.db.models import fields
from .models import Notice

from subject.serializers import SubjectCodeSerializer, ClassCodeSerializer

from rest_framework import serializers

class NoticeSerializer(serializers.ModelSerializer):
    subjectcode = SubjectCodeSerializer() 
    classcode = ClassCodeSerializer()

    class Meta:
        model = Notice
        fields = ('id', 'title', 'description', 'date_posted', 'classcode', 'subjectcode', 'author')

class NoticeCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notice
        fields = 'title', 'description', 
        