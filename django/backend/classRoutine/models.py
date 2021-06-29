from django.db import models
from django.db.models import Model
from subject.models import ClassCode
from user.models import User
from django.utils import timezone

# Create your models here.


class classRoutine(models.Model):
    subjectTeacher = models.ForeignKey(User,on_delete=models.CASCADE)
    classcode = models.ForeignKey(ClassCode,on_delete=models.CASCADE)
    time =models.DateTimeField(default = timezone.now )
    room_no = models.CharField(max_length = 200)
    link = models.URLField(max_length =  200)

    def __str__(self):
        return f"It's {self.subjectTeacher} class"











