import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hamro_kakshya/subject/classcode.dart';

class RoutineClass {
  final String subjectTeacher, room_no, link;
  final ClassCode classCode;
  String time;

  RoutineClass(
      {this.subjectTeacher,
      this.room_no,
      this.classCode,
      this.link,
      this.time}) {
    int hour, min;
    String t;
    List<String> vals = time.split('-');
    hour = int.parse(vals[0]);
    min = int.parse(vals[1]);

    if (hour > 12) {
      hour -= 12;
      t = 'PM';
    } else {
      t = 'AM';
    }

    this.time = '$hour:$min $t';
    print(this.time);
  }
  factory RoutineClass.fromJson(Map<String, dynamic> json) {
    return RoutineClass(
        // subjectTeacher: json['subjectTeacher'],
        room_no: json['room_no'],
        // classCode: ClassCode.fromJson(json['classcode']),
        link: json['link'],
        time: json['time']);
  }
  Map<String, dynamic> toJson() {
    return ({
      'subjectTeacher': this.subjectTeacher,
      'room_no': this.room_no,
      'classCode': this.classCode,
      'link': this.link,
      'time': this.time,
    });
  }
}

Future<List<RoutineClass>> fetchNotices(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://192.168.254.9:8000/classRoutine/'));

  if (response.statusCode == 200) {
    return parseNotices(response.body);
  } else {
    throw Exception('Failed to load Notice');
  }
}

List<RoutineClass> parseNotices(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  List<RoutineClass> notices =
      parsed.map<RoutineClass>((json) => RoutineClass.fromJson(json)).toList();

  return notices;
}

class Class {
  String subject;
  String venue;
  TimeOfDay classtime;

  Class({this.subject, this.venue, this.classtime});
}
