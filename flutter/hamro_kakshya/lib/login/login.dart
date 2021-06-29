import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(Login());
}

Future<LoginClass> performLogin(String username, String password) async{
  var client = http.Client();
  var url = Uri.parse('http://192.168.1.106:8000/login/');
  final response = await client.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
    if (response.statusCode == 200) {
      return LoginClass.fromJson(jsonDecode(response.body));
  } else {
      throw Exception('Failed to login the user.');
  }
} 

class LoginClass{
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
  Future<LoginClass> _futureLogin;


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
                                      ),
                          ))),
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
                                          setState(() {
                                            _futureLogin = performLogin(_usernamecontroller.text,_passwordcontroller.text);
                                          });
                                          Navigator.pushNamed(context, '/home');
                                          // Navigator.pop(context);
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

  // FutureBuilder<LoginClass> buildFutureBuilder() {
  //     return FutureBuilder<LoginClass>(
  //       future: _futureLogin,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Text(snapshot.data.username);
  //         } else if (snapshot.hasError) {
  //           return Text('${snapshot.error}');
  //         }

  //         return CircularProgressIndicator();
  //       },
  //     );
  //   }
  // }

}

