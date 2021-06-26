import 'dart:convert';

class ClassCode {
  String faculty;
  String batch;
  String code;

  ClassCode({this.faculty, this.batch, this.code});

  factory ClassCode.fromJson(Map<String, dynamic> json) {
    return ClassCode(
        faculty: json['faculty'], batch: json['batch'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'faculty': this.faculty,
      'batch': this.batch,
      'code': this.code,
    });
  }
}
