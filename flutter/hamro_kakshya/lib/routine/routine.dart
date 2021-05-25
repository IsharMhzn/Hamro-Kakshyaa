import 'package:flutter/material.dart';
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
    t: Time(hour: 13, min: 0),
  ),
  Routine(
    subj: 'COMP 303',
    place: 'Block 9, Room 404',
    type: 'Physical',
    t: Time(hour: 2, min: 45),
  ),
];

class RoutineSec extends StatefulWidget {
  @override
  _RoutineSecState createState() => _RoutineSecState();
}

class _RoutineSecState extends State<RoutineSec> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Class Routine',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff126e82),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Divider(
              color: Color(0xff51C4D3),
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SingleChildScrollView(
              child: _buildPanel(),
            ),
            ElevatedButton(
              child : Text('Upcoming Class'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>(UpcomingClass()))
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Center(
                  child: Text(
                item.headerValue,
                style: TextStyle(
                    color: Color(0xff126e82),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            );
          },
          body: Column(
            children: [
              routineCardGenerator(lectures[0]),
              routineCardGenerator(lectures[1]),
              routineCardGenerator(lectures[2]),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class Time {
  int hour, min;

  Time({this.hour, this.min});
}

class Routine {
  String subj, type, place, day;
  Time t;

  Routine({this.subj, this.type, this.place, this.t});
}

List<Item> generateItems(int numberOfItems) {
  return <String>[
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ].map((day) => Item(headerValue: day, expandedValue: day)).toList();
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
            appBar: AppBar(

              actions:[
                ElevatedButton(
              onPressed: (){
              Navigator.pop(context);
              },
              child:Text('Routine')
            ),]
            ),
            body: Column(
              children: classes.map((clas) => upcomingClasses(clas)).toList(),
            )));
  }
}
