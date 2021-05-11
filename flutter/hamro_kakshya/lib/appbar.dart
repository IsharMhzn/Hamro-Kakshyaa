import 'package:flutter/material.dart';

Widget appbar() {
  return AppBar(
    title: Text(
      "John Doe \nCE-2018",
      style: TextStyle(color: const Color(0xFF132C33)),
      ),
    backgroundColor: const Color(0xFF51C4D3),
    leading: GestureDetector(
        onTap: () {
          print('The profile icon is clicked.');
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(3, 3, 0, 3),
          child: CircleAvatar(
            radius: 2,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
        )),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 2),
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {},
          color: const Color(0xFF132C33),
          hoverColor: const Color(0xFF126E82),
        ),
      )
    ],
  );
}
