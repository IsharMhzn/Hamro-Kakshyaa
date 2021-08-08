import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter/foundation.dart';
import 'package:hamro_kakshya/subject/classcode.dart';
import 'package:hamro_kakshya/subject/subjectcode.dart';
import 'package:http/http.dart' as http;

class NoticeClass {
  final String title, description, date;
  String time;
  final SubjectCode subjectcode;
  final ClassCode classcode;

  NoticeClass(
      {this.title,
      this.description,
      // ignore: non_constant_identifier_names
      this.subjectcode,
      this.classcode,
      this.date,
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
    // print(this.time);
  }

  factory NoticeClass.fromJson(Map<String, dynamic> json) {
    return NoticeClass(
        title: json['title'],
        description: json['description'],
        subjectcode: SubjectCode.fromJson(json['subjectcode']),
        classcode: ClassCode.fromJson(json['classcode']),
        date: json['date_posted'],
        time: json['time_posted']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'title': this.title,
      'description': this.description,
      'subjectcode': this.subjectcode.toJson(),
      'classcode': this.classcode.toJson(),
    });
  }
}

Future<List<NoticeClass>> fetchNotices(http.Client client, String jwt,
    {String subject = ""}) async {
  // var url = dotenv.env['HOST'];
  print("fetching notices");
  // print(jwt);
  var bearer_token = json.decode(jwt)["access"];
  print(bearer_token);
  var url = "http://192.168.1.74:8000";
  String query = "";
  if (subject.isNotEmpty) {
    query = "?q=" + subject;
  }
  final response = await client.get(Uri.parse('$url/notice/$query'),
      headers: {"Authorization": "Bearer $bearer_token"});

  if (response.statusCode == 200) {
    return parseNotices(response.body);
  } else {
    throw Exception('Failed to load Notice');
  }
}

List<NoticeClass> parseNotices(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  List<NoticeClass> notices =
      parsed.map<NoticeClass>((json) => NoticeClass.fromJson(json)).toList();

  return notices;
}

Future<NoticeClass> createNotice(NoticeClass notice) async {
  var url = "http://192.168.1.74:8000";
  final response = await http.post(
    Uri.parse('$url/notice/create/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(notice.toJson()),
  );

  print(notice.toJson());

  if (response.statusCode == 201) {
    return NoticeClass.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create notice.');
  }
}
