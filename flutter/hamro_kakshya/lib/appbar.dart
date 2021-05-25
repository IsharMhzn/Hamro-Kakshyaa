import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFF132C33),
          hoverColor: const Color(0xFF126E82),
        ),
      )
    ],
  );
  }
}
