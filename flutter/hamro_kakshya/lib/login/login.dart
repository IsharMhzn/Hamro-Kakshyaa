import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:hamro_kakshya/main.dart';

void main() {
  runApp(Login());
}

Future<String> performLogin(String username, String password) async {
  print("loggin in...");
  var url = Uri.parse('http://192.168.100.161:8000');
  var client = http.Client();
  final response = await client.post(
    Uri.parse('$url/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    // print(response.body);
    return (response.body);
    // return LoginClass.fromJson(jsonDecode(response.body));
  }
  else{
    print('Incorrect credentials.');
  }
  return null;
}

class LoginClass {
  final String username;
  final String password;

  LoginClass({this.username, this.password});

  factory LoginClass.fromJson(Map<String, dynamic> json) {
    return LoginClass(
      username: json['username'],
      password: json['password'],
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String fieldError = '';
  String jwt;

  // Future<LoginClass> _futureLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFF126E82),
            body: new Container(
                color: const Color(0xFF51C4D3),
                margin: EdgeInsets.all(17),
                child: new Container(
                    margin: EdgeInsets.all(15),
                    color: const Color(0xFFD8E3E7),
                    // child: new Expanded(
                    child: Column(children: <Widget>[
                      new Spacer(),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            // heightFactor: 1,
                            // child: new Expanded(
                            child: Container(
                                child: Text(
                              "Login to",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Tuffy',
                                fontSize: 25,
                              ),
                            )
                                //  )
                                )),
                      ),
                      new Flexible(
                          flex: 1,
                          child: new FractionallySizedBox(
                              widthFactor: 1,
                              heightFactor: 1,
                              // child: new Expanded(
                              child: Container(
                                child: Text(
                                  "Hamro Kakshyaa",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.italianno(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  // fontSize: 40,
                                ),
                              )
                              //  )
                              )),
                      // new Spacer(),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 1,
                            // child: new Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                child: TextField(
                                  controller: _usernamecontroller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                    prefixIcon: Icon(Icons.person_outline_sharp)
                                  ),
                                ))),
                      ),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 1,
                            // child: new Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                child: TextField(
                                  controller: _passwordcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock_outlined)
                                  ),
                                ))),
                      ),
                      Center(
                          child: Text(
                        fieldError,
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      new Flexible(
                          flex: 1,
                          child: new FractionallySizedBox(
                              widthFactor: 1,
                              // heightFactor: 1,
                              // child: new Expanded(
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF126E82),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: new TextButton(
                                      onPressed: () {
                                      if (_usernamecontroller.text != '' && _passwordcontroller.text != '') {
                                          setState(() {
                                          fieldError = '';
                                        });
                                        performLogin(_usernamecontroller.text,
                                                _passwordcontroller.text)
                                            .then((value) {
                                          setState(() {
                                            // print(value);
                                            jwt = value;
                                          });
                                        });

                                        // print(jwt);
                                        if (jwt != null) {
                                          storage.write(key: "jwt", value: jwt);
                                          print("saving jwt...");
                                          print(
                                              "for id ${json.decode(jwt)["id"]}");
                                          CircularProgressIndicator();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home.fromBase64(jwt)));
                                          // Navigator.pushNamed(context, '/home');
                                          // Navigator.pop(context);
                                        }
                                      }
                                      else{
                                          setState(() {
                                            fieldError = 'All the fields are compulsory..';
                                          });
                                      }

                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Tuffy',
                                          fontSize: 20,
                                        ),
                                      ))))),
                      new Spacer(),
                    ])))));
  }
}
