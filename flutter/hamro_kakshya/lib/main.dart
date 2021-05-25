import 'package:flutter/material.dart';
import 'navbar.dart';
import 'appbar.dart';
import 'login/register1.dart';
import 'login/register2.dart';
import 'login/login.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/register1',
      // home: Navigate()
      routes: {
        '/register1': (context) => Register1(),
        '/register2': (conetxt) => Register2(),
        '/login': (context) => Login(),
        '/logour': (context) => MyAppBar(),
        '/home': (context) => Home()
      }));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}
