import 'dart:convert';

class ClassCode {
  String faculty;
  String batch;

  ClassCode({this.faculty, this.batch});

  factory ClassCode.fromJson(Map<String, dynamic> json) {
    return ClassCode(faculty: json['faculty'], batch: json['batch']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'faculty': this.faculty,
      'batch': this.batch,
    });
  }
}
