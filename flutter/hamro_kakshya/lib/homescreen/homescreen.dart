import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamro_kakshya/main.dart';
// import '../appbar.dart';
import 'notice.dart';
import 'routine.dart';

class HomeScreen extends StatefulWidget {
  String jwt;

  HomeScreen() {
    storage.read(key: "jwt").then((value) => jwt = value);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<LatestNotice>> latestNotices;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latestNotices = fetchLatestNotices(widget.jwt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          new FutureBuilder(
            future: latestNotices,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Expanded(child: noticeBlock(snapshot.data));
                } else if (snapshot.hasError) {
                  // throw Exception(snapshot.error);
                  print(snapshot.error);
                }
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
              );
            },
          ),
          Divider(
            color: Color(0xff126e82),
            indent: 60,
            endIndent: 60,
            thickness: 2,
          ),
          Expanded(child: routineBlock()),
        ],
      ),
    );
  }
}
