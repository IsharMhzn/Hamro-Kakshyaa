from django.contrib import admin
from .models import Notes
import notes
# Register your models here.
@admin.register(Notes)
class NotesAdmin(admin.ModelAdmin):
    list_display = ('date_posted','posted_By','file','description')