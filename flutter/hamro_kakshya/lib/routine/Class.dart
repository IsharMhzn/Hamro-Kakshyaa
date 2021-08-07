import 'dart:convert';
import 'package:hamro_kakshya/subject/subjectcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hamro_kakshya/subject/classcode.dart';

class RoutineClass {
  final String subjectTeacher, room_no, link, days;
  final ClassCode classcode;
  final SubjectCode subjectcode;
  final String time;

  RoutineClass(
      {this.subjectTeacher,
      this.room_no,
      this.classcode,
      this.link,
      this.subjectcode,
      this.days,
      this.time}) {
    // int hour, min;
    // String t;
    // List<String> vals = time.split('-');
    // hour = int.parse(vals[0]);
    // min = int.parse(vals[1]);

    // if (hour > 12) {
    //   hour -= 12;
    //   t = 'PM';
    // } else {
    //   t = 'AM';
    // }

    // this.time = '$hour:$min $t';
    // print(this.time);
  }
  factory RoutineClass.fromJson(Map<String, dynamic> json) {
    return RoutineClass(
      subjectTeacher: json['subjectTeacher'],
      room_no: json['room_no'],
      subjectcode: SubjectCode.fromJson(json['subjectcode']),
      classcode: ClassCode.fromJson(json['classcode']),
      link: json['link'],
      time: json['time'],
      days: json['days'],
    );
  }
  Map<String, dynamic> toJson() {
    return ({
      'subjectTeacher': this.subjectTeacher,
      'room_no': this.room_no,
      'subjectcode': this.subjectcode.toJson(),
      'classcode': this.classcode.toJson(),
      'link': this.link,
      'time': this.time,
      'days': this.time,
    });
  }
}

Future<List<RoutineClass>> fetchNotices(
  http.Client client,
) async {
  final response =
      await client.get(Uri.parse('http://192.168.254.9:8000/classRoutine/'));

  if (response.statusCode == 200) {
    return parseNotices(response.body);
  } else {
    throw Exception('Failed to load routine');
  }
}

List<RoutineClass> parseNotices(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  List<RoutineClass> routine =
      parsed.map<RoutineClass>((json) => RoutineClass.fromJson(json)).toList();

  return routine;
}

Future<RoutineClass> createRoutne(RoutineClass routine) async {
  var url = 'http://192.168.254.9:8000';
  final response = await http.post(
      Uri.parse('http://192.168.254.9:8000/classRoutine/create/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(routine.toJson()));
  print("IN createRoutine");
  print(routine.toJson());
  if (response.statusCode == 201) {
    return RoutineClass.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create routine');
  }
}

// class Class {
//   String subject;
//   String venue;
//   TimeOfDay classtime;

//   Class({this.subject, this.venue, this.classtime});
// }
