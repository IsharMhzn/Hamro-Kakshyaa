import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[00],
      appBar: AppBar(
        title: Text("Aron Shrestha \n CE-2018"),
        // actions: [
        //   IconButton(
        //     icon: Image.asset('assets/aron.jpg'),
        //     onPressed: () {},
        //   )
        // ],
        leading: GestureDetector(
            onTap: () {},
            child: IconButton(
              icon: Image.asset('assets/aron.jpg'),
              onPressed: () {},
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Image.asset('assets/logout.jpg'),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(280, 0, 280, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 40),
            Container(
              height: 250,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  SizedBox(width: 40),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/aron.jpg'),
                    radius: 50,
                  ),
                  SizedBox(width: 80),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  Text(
                    " Name : Aron Shrestha \n\n ID : as0024518 \n\n Roll no : 42 \n\n Batch : 2018 \n\n Group : CSE \n\n Role : Student",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    height: 200,
                    color: Colors.grey[700],
                  ),
                ],
              ),
              color: Colors.blueGrey[200],
            ),
            Divider(
              height: 2,
              color: Colors.grey[700],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Personal Secource Section ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height: 250,
              color: Colors.blueGrey[200],
            ),
            Divider(
              height: 2,
              color: Colors.grey[700],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blueGrey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  SizedBox(width: 30),
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  SizedBox(width: 30),
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  SizedBox(width: 30),
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  SizedBox(width: 30),
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
