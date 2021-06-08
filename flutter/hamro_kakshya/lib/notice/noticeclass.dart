import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NoticeClass {
  final String title, description, subj_code;

  NoticeClass({
    this.title,
    this.description,
    // ignore: non_constant_identifier_names
    this.subj_code,
  });

  factory NoticeClass.fromJson(Map<String, dynamic> json) {
    return NoticeClass(
      title: json['title'],
      description: json['description'],
      subj_code: json['subj_code'],
    );
  }
}

Future<List<NoticeClass>> fetchNotices(http.Client client,
    {String subject = ""}) async {
  String query = "";
  if (subject.isNotEmpty) {
    query = "?q=" + subject;
  }
  final response =
      await client.get(Uri.parse('http://192.168.1.74:8000/notice/${query}'));

  print(query);

  if (response.statusCode == 200) {
    return compute(parseNotices, response.body);
  } else {
    throw Exception('Failed to load Notice');
  }
}

List<NoticeClass> parseNotices(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NoticeClass>((json) => NoticeClass.fromJson(json)).toList();
}
