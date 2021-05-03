import 'package:flutter/material.dart';

Widget appbar() {
  return AppBar(
    title: Text("Aron Shrestha \n CE-2018"),
    backgroundColor: Color(0xff51C4D3),
    leading: GestureDetector(
        onTap: () {
          print('The profile icon is clicked.');
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(3, 3, 0, 3),
          child: CircleAvatar(
            radius: 2,
            backgroundImage: AssetImage('assets/images/ishar.jpg'),
          ),
        )),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 2),
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {},
        ),
      )
    ],
  );
}
