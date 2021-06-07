from rest_framework import serializers
from . models import User, Teacher, Student

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'is_student', 'is_teacher', 'faculty', 'photo')

class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'
    
class RegisterSerializer(serializers.ModelSerializer):

    class RegisterStudentSerializer(serializers.ModelSerializer):
        class Meta:
            model = Student
            fields = ('registration_no', 'batch', 'is_CR',)

    class RegisterTeacherSerializer(serializers.ModelSerializer):
        class Meta:
            model = Teacher
            fields = ('email',)

    student = RegisterStudentSerializer(required= False)
    teacher = RegisterTeacherSerializer(required = False)
    class Meta: 
        model = User
        fields = ('id', 'username', 'password', 'is_student', 'is_teacher', 'faculty', 'photo','student', 'teacher')
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
            student_data = validated_data.pop('student')
            create_student = Student.objects.create(
                user = user,
                # registration_no = validated_data['registration_no'],
                # batch = validated_data['batch'],
                # is_CR = validated_data['is_CR'],
                **student_data,
            )

        elif is_teacher:
            teacher_data = validated_data.pop('teacher')
            create_teacher = Teacher.objects.create(
                user = user,
                **teacher_data,
            )

        else:
            pass

        return user


# class LoginSerializer(serializers.Serializer):

    

