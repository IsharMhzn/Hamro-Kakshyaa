import 'dart:convert';
import 'package:hamro_kakshya/main.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Profile());
}

class Student {
  String name, group, role = "Student";
  int batch, reg_no;

  Student({this.name, this.group, this.batch, this.reg_no});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['user']['name'],
      group: json['user']['faculty'],
      batch: json['batch'],
      reg_no: json['registration_no'],
    );
  }
}

class Teacher {
  String name, faculty, email, role = "Teacher";

  Teacher({this.name, this.faculty, this.email});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['user']['name'],
      faculty: json['user']['faculty'],
      email: json['email'],
    );
  }
}

Future<Student> fetchStudent(http.Client client, String jwt) async {
  print("fetching student profile");

  var bearer_token = json.decode(jwt)["access"];
  var id = json.decode(jwt)["id"];
  var url = "http://192.168.1.74:8000/student/${id}";

  final response = await client
      .get(Uri.parse(url), headers: {"Authorization": "Bearer $bearer_token"});

  if (response.statusCode == 200) {
    return Student.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load profile');
  }
}

Future<Teacher> fetchTeacher(http.Client client, String jwt) async {
  print("fetching teacher profile");

  var bearer_token = json.decode(jwt)["access"];
  var id = json.decode(jwt)["id"];
  var url = "http://192.168.1.74:8000/teacher/${id}";

  final response = await client
      .get(Uri.parse(url), headers: {"Authorization": "Bearer $bearer_token"});

  if (response.statusCode == 200) {
    return Teacher.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load profile');
  }
}

class Profile extends StatefulWidget {
  String jwt;

  Profile() {
    storage.read(key: "jwt").then((value) => jwt = value);
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Student> futureStudent;
  Future<Teacher> futureTeacher;
  String role;

  @override
  void initState() {
    role = json.decode(widget.jwt)["is_student"] ? "student" : "teacher";
    if (role == "student") {
      futureStudent = fetchStudent(http.Client(), widget.jwt);
    } else if (role == "teacher") {
      futureTeacher = fetchTeacher(http.Client(), widget.jwt);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[00],
        body: FutureBuilder(
          future: this.role == "student" ? futureStudent : futureTeacher,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ProfileSec(data: snapshot.data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
            ));
          },
        ));
  }
}

class ProfileSec extends StatelessWidget {
  var data;

  ProfileSec({this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 30),
                SizedBox(width: 20),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Text(
                  data.role == "Student"
                      ? " Name : ${data.name} \n Reg. no : ${data.reg_no} \n Roll no : 42 \n Batch : ${data.batch} \n Group : ${data.group} \n Role : ${data.role}"
                      : " Name: ${data.name} \n Email: ${data.email} \n Faculty: ${data.faculty} \n Role: ${data.role}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Divider(
                  height: 5,
                  color: Colors.blue,
                ),
              ],
            ),
            color: Color(0xffe1f6f7),
          ),
          Divider(
            height: 5,
            color: Colors.grey[700],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: new Center(
              child: Text(
                "Personal Recource Section ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            height: 250,
            color: Color(0xffe1f6f7),
          ),
          Divider(
            height: 5,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
