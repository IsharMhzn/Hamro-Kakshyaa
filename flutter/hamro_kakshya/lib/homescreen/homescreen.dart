import 'package:flutter/material.dart';
// import '../appbar.dart';
import 'notice.dart';
import 'routine.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: noticeBlock()
          ),
          Divider(
            color: Color(0xff126e82),
            indent: 60,
            endIndent: 60,
            thickness: 2,
          ),
          Expanded(
            child: routineBlock()
          ),
        ],
      ),
    );
  }
}
