from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Teacher, Student

# Register your models here.
class MyUserAdmin(UserAdmin):
    model = User
    fieldsets = UserAdmin.fieldsets + ((None,{'fields' : ('faculty', 'is_student', 'is_teacher', 'photo')}),)
    list_display = ['id', 'username', 'faculty', 'is_student', 'is_teacher' ]
    list_editable = ['faculty']
    search_fields = ['username']
    list_filter = ['faculty', 'is_student', 'is_teacher']

class TeacherAdmin(admin.ModelAdmin):
    model = Teacher
    list_display = ['user', 'email']
    search_fields = ['user__username', 'user__faculty']

class StudentAdmin(admin.ModelAdmin):
    model = Student
    list_display = ['is_CR', 'user', 'registration_no', 'batch']
    list_filter = ['is_CR', 'batch', 'user__faculty']
    search_fields = ['user__username', 'batch', 'user__faculty']


admin.site.register(User, MyUserAdmin)
admin.site.register(Teacher, TeacherAdmin)
admin.site.register(Student, StudentAdmin)


