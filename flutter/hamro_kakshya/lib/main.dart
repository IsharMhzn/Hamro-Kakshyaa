import 'dart:convert';

import 'package:flutter/material.dart';
import 'navbar.dart';
import 'appbar.dart';
import 'login/register1.dart';
import 'login/register2.dart';
import 'login/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

final storage = FlutterSecureStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );

  // await dotenv.load(fileName: "assets/env/.env");
  runApp(MaterialApp(
      // home: Home(),
      // home: Register1(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/register1',
      // home: Navigate()
      routes: {
        '/register1': (context) => Register1(),
        '/register2': (conetxt) => Register2(),
        '/login': (context) => Login(),
        '/logout': (context) => AppBarProfile(),
        // '/home': (context) => Home(),
      }));
}

class Home extends StatelessWidget {
  Home(this.jwt, this.payload);

  factory Home.fromBase64(String jwt) => Home(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;
  @override
  Widget build(BuildContext context) {
    return NavBar(jwt: jwt);
  }
}
