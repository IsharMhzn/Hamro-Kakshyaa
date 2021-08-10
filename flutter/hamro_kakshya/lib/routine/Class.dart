import 'dart:convert';
import 'package:hamro_kakshya/subject/subjectcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hamro_kakshya/subject/classcode.dart';

class realClass {
  final String subjectTeacher, room_no, link, day, time;
  final ClassCode classcode;
  final SubjectCode subjectcode;

  realClass(
      {this.subjectTeacher,
      this.room_no,
      this.classcode,
      this.link,
      this.subjectcode,
      this.day,
      this.time}) {}
}

Map<String, List> reaarangeclass(List<RoutineClass> r_list) {
  List<String> weekdays = ['sun', 'mon', 'tue', 'wed', 'thur', 'fri'];
  Map<String, List> rc_map = {};

  for (String d in weekdays) {
    rc_map[d] = [];
  }

  print(rc_map);

  for (int i = 0; i < r_list.length; i++) {
    RoutineClass r_obj = r_list[i];
    List days = r_list[i].Days;
    for (int j = 0; j < days.length; j++) {
      var day = days[j].toLowerCase();
      realClass rc = realClass(
          subjectTeacher: r_obj.subjectTeacher,
          room_no: r_obj.room_no,
          classcode: r_obj.classcode,
          link: r_obj.link,
          subjectcode: r_obj.subjectcode,
          day: r_obj.days,
          time: r_obj.time);

      rc_map[day].add(rc);
    }
  }
  print(rc_map);
  return rc_map;
}

class RoutineClass {
  final String subjectTeacher, room_no, link, days;
  List<String> Days = [];
  final ClassCode classcode;
  final SubjectCode subjectcode;
  String time;

  RoutineClass(
      {this.subjectTeacher,
      this.room_no,
      this.classcode,
      this.link,
      this.subjectcode,
      this.days,
      this.time}) {
    // if (hour > 12) {
    //   hour -= 12;
    //   t = 'PM';
    // } else {
    //   t = 'AM';
    // }

    // print(this.time);
    List<String> day = days.split('-');
    // print("This is time");s
    // print(this.time);
    // print(this.days);
    // print("Printing days");
    // print(day);
    // print(Days);

    for (int i = 0; i < day.length; i++) {
      print(day[i]);
      Days.add(day[i]);
    }
    // print("Days below");
    // print(Days);
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
      'days': this.days,
    });
  }
}

Future<Map<String, List>> fetchNotices(
  http.Client client,
) async {
  final response =
      await client.get(Uri.parse('http://192.168.1.74:8000/classRoutine/'));

  if (response.statusCode == 200) {
    return reaarangeclass(parseNotices(response.body));
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
  final response = await http.post(
      Uri.parse('http://192.168.1.74:8000/classRoutine/create/'),
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