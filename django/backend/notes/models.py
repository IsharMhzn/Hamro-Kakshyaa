from django.db import models
from django.utils import timezone
from django.core.validators import FileExtensionValidator


# Create your models here.
class Notes(models.Model):
    date_posted = models.DateTimeField(default = timezone.now ) 
    posted_By = models.CharField(max_length = 100)
    description =  models.TextField()
    title = models.CharField(max_length=100)
    file =  models.FileField(upload_to='documents/',validators=[
        FileExtensionValidator(allowed_extensions=['pdf', 'doc', 'ppt', 'xlsx','docx'])])   

