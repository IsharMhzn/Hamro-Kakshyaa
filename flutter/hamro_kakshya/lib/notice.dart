import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<NoticeClass> fetchNotice() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.74:8000/notice/2/'));

  if (response.statusCode == 200) {
    return NoticeClass.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Notice');
  }
}

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

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  List<int> notices = [];
  Future<NoticeClass> futureNotice;

  @override
  void initState() {
    for (int i = 1; i < 51; i++) {
      notices.add(i);
    }
    futureNotice = fetchNotice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hamroo Kakshyaa",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          body: FutureBuilder(
        future: futureNotice,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: notices.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    color: Color(0xffe1f6f7),
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: new ListTile(
                      leading: new Icon(
                        Icons.notifications_active,
                        color: const Color(0xFF132C33),
                        size: 30.0,
                      ),
                      title: new Text(snapshot.data.title),
                      subtitle: new Text(snapshot.data.description),
                      // isThreeLine: true,
                      trailing: new Icon(
                        Icons.arrow_right,
                        color: const Color(0xFF132C33),
                        size: 30.0,
                        semanticLabel: 'Know more about the notice.',
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
