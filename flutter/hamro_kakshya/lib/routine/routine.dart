import 'package:flutter/material.dart';
import '../homescreen/routine.dart';
import 'routinepage.dart';
import 'package:http/http.dart' as http;
import './Class.dart';

class RoutineSec extends StatefulWidget {
  @override
  _RoutineSecState createState() => _RoutineSecState();
}

class _RoutineSecState extends State<RoutineSec> {
  Future<List<RoutineClass>> futureRoutine;

  @override
  void initState() {
    futureRoutine = fetchNotices(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hamroo Kakshyaa",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: FutureBuilder(
          future: futureRoutine,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return RoutineList(classes: snapshot.data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
            ));
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print("Notice post button pressed");
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => NoticeForm()));
        //   },
        //   child: Icon(Icons.add),
        //   backgroundColor: Color(0xFF126E82),
        // ),
      ),
    );
  }
}

class RoutineList extends StatelessWidget {
  final List<RoutineClass> classes;
  RoutineList({this.classes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(classes[index].time),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        });
  }
}






// class NoticeList extends StatelessWidget {
//   final List<NoticeClass> notices;

//   NoticeList({this.notices});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: notices.length,
//         itemBuilder: (BuildContext context, int index) {
//           return new Card(
//             color: Color(0xffe1f6f7),
//             margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => NoticeDetail(
//                               notices: this.notices,
//                               index: index,
//                             )));
//               },
//               child: new ListTile(
//                 leading: new Icon(
//                   Icons.notifications_active,
//                   color: const Color(0xFF132C33),
//                   size: 30.0,
//                 ),
//                 title: new Text(notices[index].subjectcode.code),
//                 subtitle: new Text(notices[index].title),
//                 // isThreeLine: true,
//                 trailing: new Icon(
//                   Icons.arrow_right,
//                   color: const Color(0xFF132C33),
//                   size: 30.0,
//                   semanticLabel: 'Know more about the notice.',
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         RoutinePage(),
//         ElevatedButton(
//           child: Text('Upcoming Class'),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => (UpcomingClass())));
//           },
//         )
//       ],
//     ));
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Center(
//                   child: Text(
//                 item.headerValue,
//                 style: TextStyle(
//                     color: Color(0xff126e82),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               )),
//             );
//           },
//           body: Column(
//             children: [
//               routineCardGenerator(lectures[0]),
//               routineCardGenerator(lectures[1]),
//               routineCardGenerator(lectures[2]),
//             ],
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// class UpcomingClass extends StatefulWidget {
//   @override
//   _UpcomingClassState createState() => _UpcomingClassState();
// }

// double Time_to_double(time) =>
//     time.hour.toDouble() + (time.minute.toDouble() / 60);

// Widget upcomingClasses(classes) {
//   TimeOfDay now = TimeOfDay.now();
//   double doubleNowVal = Time_to_double(now);
//   double timeofclass = Time_to_double(classes.classtime);

//   print(doubleNowVal);
//   print(timeofclass);
//   if (doubleNowVal < timeofclass) {
//     return Card(
//         margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
//         color: Color(0xffe1f6f7),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(classes.subject),
//               subtitle: Text(classes.venue),
//               trailing: Text(classes.classtime.toString()),
//             )
//           ],
//         ));
//   } else {
//     return Card(
//         margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
//         color: Color(0xffe1f6f7),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text("empty"),
//             )
//           ],
//         ));
//   }
// }

// class _UpcomingClassState extends State<UpcomingClass> {
//   List<Class> classes = [
//     Class(
//         subject: 'COMP 208',
//         venue: 'Block 9 204',
//         classtime: TimeOfDay(hour: 12, minute: 0)),
//     Class(
//         subject: 'COMP 205',
//         venue: 'Block 9 304',
//         classtime: TimeOfDay(hour: 15, minute: 0)),
//     Class(
//         subject: 'COMP 215',
//         venue: 'Block 9 304',
//         classtime: TimeOfDay(hour: 9, minute: 0)),
//     Class(
//         subject: 'COMP 209',
//         venue: 'Block 9 304',
//         classtime: TimeOfDay(hour: 8, minute: 0)),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             backgroundColor: Colors.blue,
//             appBar: AppBar(actions: [
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Routine')),
//             ]),
//             body: Column(
//               children: classes.map((clas) => upcomingClasses(clas)).toList(),
//             )));
//   }
// }
