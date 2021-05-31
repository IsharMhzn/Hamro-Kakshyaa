import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../homescreen/routine.dart';
import 'Class.dart';

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
            height: 20,
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
          ),
          ElevatedButton(
            child: Text('Upcoming Class'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF126E82), // background
              onSurface: Colors.yellow,
              onPrimary: Colors.white, // foreground
            ), 
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (UpcomingClass())));
            },
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

class UpcomingClass extends StatefulWidget {
  @override
  _UpcomingClassState createState() => _UpcomingClassState();
}

double Time_to_double(time) =>
    time.hour.toDouble() + (time.minute.toDouble() / 60);

Widget upcomingClasses(classes) {
  TimeOfDay now = TimeOfDay.now();
  double doubleNowVal = Time_to_double(now);
  double timeofclass = Time_to_double(classes.classtime);

  print(doubleNowVal);
  print(timeofclass);
  if (doubleNowVal < timeofclass) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
        color: Color(0xffe1f6f7),
        child: Column(
          children: [
            ListTile(
              title: Text(classes.subject),
              subtitle: Text(classes.venue),
              trailing: Text(classes.classtime.toString()),
            )
          ],
        ));
  } else {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
        color: Color(0xffe1f6f7),
        child: Column(
          children: [
            ListTile(
              title: Text("empty"),
            )
          ],
        ));
  }
}

class _UpcomingClassState extends State<UpcomingClass> {
  List<Class> classes = [
    Class(
        subject: 'COMP 208',
        venue: 'Block 9 204',
        classtime: TimeOfDay(hour: 22, minute: 0)),
    Class(
        subject: 'COMP 205',
        venue: 'Block 9 304',
        classtime: TimeOfDay(hour: 15, minute: 0)),
    Class(
        subject: 'COMP 215',
        venue: 'Block 9 304',
        classtime: TimeOfDay(hour: 9, minute: 0)),
    Class(
        subject: 'COMP 209',
        venue: 'Block 9 304',
        classtime: TimeOfDay(hour: 8, minute: 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // backgroundColor: const Color(0xffe1f6f7),
            appBar: AppBar(
              backgroundColor: const Color(0xFF51C4D3),
              actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF126E82), // background
                  onSurface: Colors.yellow,
                  onPrimary: Colors.white, // foreground
                ), 
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Routine')),
            ]),
            body: Column(
              children: classes.map((clas) => upcomingClasses(clas)).toList(),
            )));
  }
}
