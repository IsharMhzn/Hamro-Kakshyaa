from django.db import models
from django.contrib.auth.models import User

# Create your models here.
# class Class(models.Model):
#     course = models.CharField(max_length=100, blank=False, default="Computer Engineering")
#     batch = models.IntegerField(default=2018)
    
#     @property
#     def code(self):
#         return ''.join((str(l[0]) for l in self.course.split())) + str(self.batch)[-2:]

class Notice(models.Model):
    title = models.CharField(max_length=150, default="This is the title")
    description = models.TextField()
    subj_code = models.CharField(default="COMP101", max_length=15)
    date_posted = models.DateTimeField(auto_now=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    classcode = models.CharField(default='CE18', max_length=10)
    # code = models.ForeignKey(Class, on_delete=models.CASCADE)

