import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
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
                    child: new Column(children: <Widget>[
                      new Spacer(),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            // heightFactor: 1,
                            child: Container(
                                // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                // color: const Color(0xFFFCD5DD),
                                // child: Center(
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
                              child: Container(
                                // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                // color: const Color(0xFFFCD5DD),
                                // child: Center(
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
                            child: Container(
                                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                // color: const Color(0xFFFCD5DD),
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Registration number',
                                  ),
                                ))),
                      ),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 1,
                            child: Container(
                                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                // color: const Color(0xFFFCD5DD),

                                child: TextField(
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
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF126E82),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: new TextButton(
                                      onPressed: () {
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
}
