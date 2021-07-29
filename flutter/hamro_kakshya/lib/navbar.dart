import 'package:flutter/material.dart';
import 'appbar.dart';
import 'homescreen/homescreen.dart';
import 'notice/notice.dart';
import 'profile/profile.dart';
import 'routine/routinepage.dart';
import 'routine/routine.dart';
import 'note.dart';
// import 'routine/routine.dart';

void main() {
  runApp(MaterialApp(
    home: NavBar(),
    debugShowCheckedModeBanner: false,
  ));
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: MyAppBar(),
          bottomNavigationBar: new Material(
            color: const Color(0xFF126E82),
            child: TabBar(
                labelColor: const Color(0xFF51C4D3),
                unselectedLabelColor: const Color(0xFFD8E3E7),
                indicatorColor: const Color(0xFF51C4D3),
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.notifications_active)),
                  Tab(icon: Icon(Icons.book_outlined)),
                  Tab(icon: Icon(Icons.school)),
                  Tab(icon: Icon(Icons.person)),
                ]),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              Notice(),
              Note(),
              RoutineSec(),
              Profile(),
            ],
          )),
    );
  }
}
