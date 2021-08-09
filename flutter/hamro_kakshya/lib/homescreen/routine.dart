import 'package:flutter/material.dart';

class Time {
  int hour, min;

  Time({this.hour, this.min});
}

class Routine {
  String subj, type, place;
  Time t;

  Routine({this.subj, this.type, this.place, this.t});
}

Widget routineCardGenerator(lecture) {
  return Card(
    color: Color(0xffe1f6f7),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Code: ${lecture.subjectcode.code}',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text('Time: ${lecture.time}',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Physical class',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text('${lecture.room_no}',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget routineBlock() {
  List<Routine> lectures = [
    Routine(
      subj: 'COMP 311',
      place: 'Block 9, Room 302',
      type: 'Physical',
      t: Time(hour: 9, min: 30),
    ),
    Routine(
      subj: 'MGTS 301',
      place: 'Meet: hty-asf-asd',
      type: 'Online',
      t: Time(hour: 13, min: 0),
    ),
    Routine(
      subj: 'COMP 303',
      place: 'Block 9, Room 404',
      type: 'Physical',
      t: Time(hour: 2, min: 45),
    ),
  ];

  return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Todays\' Routine',
                style: TextStyle(
                    color: Color(0xff126e82),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          Divider(
            color: Color(0xff51C4D3),
            thickness: 2,
            indent: 100,
            endIndent: 100,
          ),
          Column(
              children: lectures
                  .map((lecture) => routineCardGenerator(lecture))
                  .toList())
        ],
      ));
}
