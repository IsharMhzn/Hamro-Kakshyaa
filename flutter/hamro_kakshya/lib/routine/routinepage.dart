import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../homescreen/routine.dart';

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
    t: Time(hour: 1, min: 30),
  ),
  Routine(
    subj: 'COMP 303',
    place: 'Block 9, Room 404',
    type: 'Physical',
    t: Time(hour: 2, min: 45),
  ),
];

int isActive = 0;

class RoutinePage extends StatefulWidget {
  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff5BD7E8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                )),
            child: Center(
              child: Text(
                "May 20, Thursday",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  daycardbutton("Thurs", "20 May", today: true),
                  daycardbutton("Fri", "21 May"),
                  daycardbutton("Sun", "23 May")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  daycardbutton("Mon", "24 May"),
                  daycardbutton("Tues", "25 May"),
                  daycardbutton("Wed", "26 May"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                  children: lectures
                      .map((lecture) => routineCardGenerator(lecture))
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}

Widget daycardbutton(String day, String date, {bool today = false}) {
  return Container(
    height: 80,
    width: 80,
    child: Card(
      color: today ? Colors.lightBlue[300] : Colors.lightBlue[100],
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date),
            Text(day),
          ],
        ),
      ),
    ),
  );
}
