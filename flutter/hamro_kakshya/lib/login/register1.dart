import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(Register1());
}

class Register1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xFF126E82),
      body : new Container(
        color: const Color(0xFF51C4D3),
        margin: EdgeInsets.all(17),
        child: new Container(
          margin: EdgeInsets.all(15),
          color: const Color(0xFFD8E3E7),
          child: new Column(
            children: <Widget> [
            new Spacer(),
            new Flexible(
                flex:1,
                child: new FractionallySizedBox(
                  widthFactor: 1,
                  // heightFactor: 1,
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    // color: const Color(0xFFFCD5DD),
                    // child: Center(
                      child: Text(
                        "Welcome to",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Tuffy',
                          fontSize: 25,
                        ),
                        )
                    //  )
                  )
                ),
            ),
            new Flexible(
            flex:2,
            child: new FractionallySizedBox(
              widthFactor: 1,
              // heightFactor: 1,
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
                  )
            
          ),
          new Flexible(
           flex:7,
            child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 20, 32, 20),
                // color: const Color(0xFFFCD5DD),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                  "ID Card Scanner goes here.",
                  style: TextStyle(fontFamily: 'Tuffy',)
                ),
                )
              )
            ),
          ),
           new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              // heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0), 
                decoration: BoxDecoration(
                  color: const Color(0xFF126E82),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: new TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/register2');
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'Tuffy',
                          fontSize: 20,),
                    )
                )
                )
              )
            ),
            // new Spacer(),
           ]
        

        )
      )
    )
    )
    );
  }
}