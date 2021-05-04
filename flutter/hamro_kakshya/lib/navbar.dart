import 'package:flutter/material.dart';
import 'appbar.dart';
import 'homescreen/homescreen.dart';
import 'notice.dart';
import 'profile.dart';

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
            appBar: appbar(),
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
                ]
              ),
            ),
            body: TabBarView(
              children: [
                HomeScreen(),
                Notice(),
                Center( child: Text(
                  "Notes Page", 
                  style: TextStyle(
                    color: const Color(0xFF132C33),
                    fontSize: 40),
                    )
                  ),
                Center( child: Text(
                  "Routine Page", 
                  style: TextStyle(
                    color: const Color(0xFF132C33),
                    fontSize: 40),
                    )
                  ),
                Profile(),
            ],
          )
          ),
        );
  }
}
