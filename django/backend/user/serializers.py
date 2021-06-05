from rest_framework import serializers
from . models import User, Teacher, Student

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'is_student', 'is_teacher', 'faculty', 'photo')

class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'
    
class RegisterSerializer(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = ('id', 'username', 'email', 'password', 'is_student', 'is_teacher', 'faculty', 'photo',)
        extra_kwargs = {'password':{'write_only':True}}

    def create(self, validated_data):
        user = User.objects.create_user(
            username = validated_data['username'],
            password = validated_data['password'],
            is_student = validated_data['is_student'],
            is_teacher = validated_data['is_teacher'],
            faculty = validated_data['faculty'],
            photo = validated_data['photo']
        )
        is_student = validated_data['is_student']
        is_teacher = validated_data['is_teacher']

        if is_student:
            student = Student.objects.create(
                user = user,
                registration_no = validated_data['registration_no'],
                batch = validated_data['batch'],
                is_CR = validated_data['is_CR'],
            )

        elif is_teacher:
            teacher = Teacher.objects.create(
                user = user,
                email = validated_data['email'],
            )

        else:
            pass

        return user


# class LoginSerializer(serializers.Serializer):

    

