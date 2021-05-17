import 'package:flutter/material.dart';
import 'Class.dart';

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
        classtime: TimeOfDay(hour: 12, minute: 0)),
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
            backgroundColor: Colors.blue,
            body: Column(
              children: classes.map((clas) => upcomingClasses(clas)).toList(),
            )));
  }
}
