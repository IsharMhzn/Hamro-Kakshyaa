import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[00],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                      radius: 30),
                  SizedBox(width: 20),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Text(
                    " Name : John Doe \n ID : as0024518 \n Roll no : 42 \n Batch : 2018 \n Group : CSE \n Role : Student",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    height: 5,
                    color: Colors.blue,
                  ),
                ],
              ),
              color: Color(0xffe1f6f7),
            ),
            Divider(
              height: 5,
              color: Colors.grey[700],
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: new Center(
                child: Text(
                  "Personal Recource Section ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 250,
              color: Color(0xffe1f6f7),
            ),
            Divider(
              height: 5,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}
