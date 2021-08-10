import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hamro_kakshya/main.dart';

class LatestNotice {
  String subject;
  String code;

  LatestNotice({this.subject, this.code});

  factory LatestNotice.fromJson(Map<String, dynamic> json) {
    return LatestNotice(
        code: json['subjectcode']['code'], subject: json['title']);
  }
}

Future<List<LatestNotice>> fetchLatestNotices(String jwt) async {
  print("Fetching latest notices");

  Future.delayed(Duration(seconds: 1));

  String bearer_token = json.decode(jwt)['access'];
  print("Requesting url");
  var url = "http://192.168.1.74:8000/notice/latest/";

  var response = await http.Client().get(Uri.parse(url), headers: {
    'Authorization': "Bearer $bearer_token",
  });

  if (response.statusCode == 200) {
    var r = json
        .decode(response.body)
        .cast<Map<String, dynamic>>()
        .map<LatestNotice>((json) => LatestNotice.fromJson(json))
        .toList();
    // print(r);
    return r;
  } else {
    throw Exception("Failed to load latest notices");
  }
}

Map icons = {
  'cancel': Icons.cancel_rounded,
  'exam': Icons.album,
  'due': Icons.alarm
};

Widget noticeCardGenerator(notice) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListTile(
          leading: Icon(
            Icons.alarm,
            color: Color(0xff51C4D3),
          ),
          title: Text(
            "${notice.code}: ${notice.subject}",
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    color: Color(0xffe1f6f7),
  );
}

Widget noticeBlock(List<LatestNotice> latestNotices) {
  print(latestNotices);
  return Container(
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Latest notices',
                  style: TextStyle(
                      color: Color(0xff126e82),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            Divider(
              color: Color(0xff51C4D3),
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            // Expanded(
            Column(
              children: latestNotices
                  .map(
                    (notice) => noticeCardGenerator(notice),
                  )
                  .toList(),
            ),
          ],
        ),
      ));
}
