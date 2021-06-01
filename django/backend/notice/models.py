from django.db import models
from user.models import User

# Create your models here.
class Notice(models.Model):
    title = models.CharField(max_length=150, default="This is the title")
    description = models.TextField()
    date_posted = models.DateTimeField(auto_now=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
