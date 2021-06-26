from rest_framework import serializers
from .models import classRoutine

class ClassRoutineSerializer(serializers.ModelSerializer):
    class Meta:
        model = classRoutine
        fields = '__all__'
