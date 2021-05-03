import 'package:flutter/material.dart';

class LatestNotice {
  String notice;
  String type;

  LatestNotice({this.notice, this.type});
}

Map icons = {
  'cancel': Icons.cancel_rounded,
  'exam': Icons.album,
  'due': Icons.alarm
};

Widget noticeCardGenerator(notice) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListTile(
          leading: Icon(
            icons[notice.type],
            color: Color(0xff51C4D3),
          ),
          title: Text(
            notice.notice,
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    color: Color(0xffe1f6f7),
  );
}

Widget noticeBlock() {
  List<LatestNotice> latest_notices = [
    LatestNotice(
        notice: 'COMP 311 class on 29th April is canceled.', type: 'cancel'),
    LatestNotice(
        notice: 'COMP 314 internal exam is on 4th May, 2021.', type: 'exam'),
    LatestNotice(
        notice: 'COEG 311 assignment 3 is due on 26th April, 2021.',
        type: 'due'),
  ];

  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Latest notices',
              style: TextStyle(
                  color: Color(0xff126e82),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )),
        Divider(
          color: Color(0xff51C4D3),
          thickness: 3,
          indent: 100,
          endIndent: 100,
        ),
        Column(
          children: latest_notices
              .map(
                (notice) => noticeCardGenerator(notice),
              )
              .toList(),
        ),
      ],
    ),
  );
}
