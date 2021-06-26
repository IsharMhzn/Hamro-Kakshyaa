import 'dart:convert';

class SubjectCode {
  String code, name;

  SubjectCode({this.code, this.name});

  factory SubjectCode.fromJson(Map<String, dynamic> json) {
    print(json);
    return SubjectCode(code: json['code'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'code': this.code,
      'name': this.name,
    });
  }
}
