import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './noticeclass.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  Future<List<NoticeClass>> futureNotices;
  // final subjectController = TextEditingController();

  @override
  void initState() {
    futureNotices = fetchNotices(http.Client());
    super.initState();
  }

  @override
  void dispose() {
    // subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hamroo Kakshyaa",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          body: FutureBuilder(
        future: futureNotices,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NoticeList(notices: snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
          ));
        },
      )),
    );
  }
}

class NoticeList extends StatelessWidget {
  final List<NoticeClass> notices;

  NoticeList({this.notices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notices.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            color: Color(0xffe1f6f7),
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.notifications_active,
                  color: const Color(0xFF132C33),
                  size: 30.0,
                ),
                title: new Text(notices[index].subj_code),
                subtitle: new Text(notices[index].title),
                // isThreeLine: true,
                trailing: new Icon(
                  Icons.arrow_right,
                  color: const Color(0xFF132C33),
                  size: 30.0,
                  semanticLabel: 'Know more about the notice.',
                ),
              ),
            ),
          );
        });
  }
}
