import 'package:flutter/material.dart';
import 'navbar.dart';
import 'routine/routinepage.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}
