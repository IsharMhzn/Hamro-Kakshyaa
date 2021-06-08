from django.db import models

# Create your models here.
class ClassCode(models.Model):
    faculty = models.CharField(max_length=150)
    batch = models.CharField(max_length=100)


class SubjectCode(models.Model):
    code = models.CharField(max_length=100)
    #can we do it using dictionary for subject mapping sbject code 
    








 