from django.db.models import fields
from .models import Notice

from rest_framework import serializers

class NoticeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notice
        fields = ('id', 'title', 'description', 'date_posted', 'author')
        