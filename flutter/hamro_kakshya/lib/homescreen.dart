import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: Color(0xff51C4D3),
                  height: 64,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage('assets/images/ishar.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ishar Maharjan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              'CE-2018',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // Top bar
                Divider(
                  color: Color(0xff51C4D3),
                  thickness: 3,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Latest Notices',
                          style:
                              TextStyle(color: Color(0xff132C33), fontSize: 30),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Color(0xffD8E3E7),
                            height: 64,
                            width: 400,
                            child: Center(
                              child: Text(
                                'COMP 311 class on 29th April is canceled.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Color(0xffD8E3E7),
                            height: 64,
                            width: 400,
                            child: Center(
                              child: Text(
                                'COMP 314 internal exam is on 4th May, 2021.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Color(0xffD8E3E7),
                            height: 64,
                            width: 400,
                            child: Center(
                              child: Text(
                                'COEG 311 assignment 3 is due on 26th April, 2021.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // Latest notices
                Divider(
                  color: Color(0xff51C4D3),
                  thickness: 3,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'Routine',
                          style:
                              TextStyle(color: Color(0xff132C33), fontSize: 30),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Color(0xffD8E3E7),
                            height: 64,
                            width: 400,
                            child: Center(
                              child: Text(
                                'COMP 304 class is at 12:00 pm in room no. 304, block 9.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Color(0xffD8E3E7),
                            height: 64,
                            width: 400,
                            child: Center(
                              child: Text(
                                'MGTS 312 class is at 2:015 pm in room no. 102, block 10.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //Routine
                Divider(
                  color: Color(0xff51C4D3),
                  thickness: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
