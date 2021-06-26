import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<NotesClass> fetchNotes() async {
  final response = await http.get(Uri.parse('http://192.168.1.74:8000/notes/'));

  if (response.statusCode == 200) {
    return NotesClass.fromJson(jsonDecode(response.body)[0]);
  } else {
    throw Exception('Failed to load Notice');
  }
}

class NotesClass {
  final String date_posted;
  final String posted_By;
  final String title;
  final String classcode;
  final String file;

  NotesClass({
    this.date_posted,
    this.classcode,
    this.posted_By,
    this.title,
    this.file,
  });
  factory NotesClass.fromJson(Map<String, dynamic> json) {
    return NotesClass(
      date_posted: json['date_posted'],
      posted_By: json['posted_By'],
      title: json['title'],
      classcode: json['classcode'],
      file: json['file'],
    );
  }
}

void main() {
  runApp(Note());
}

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<int> notes = [];
  Future<NotesClass> futureNotes;

  @override
  void initState() {
    futureNotes = fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<NotesClass>(
            future: futureNotes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       // title: "Hamroo Kakshyaa",
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//           body: FutureBuilder(
//         future: futureNotes,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (BuildContext context, int index) {
//                   return new Card(
//                     color: Color(0xffe1f6f7),
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//                     child: new ListTile(
//                       leading: new Icon(
//                         Icons.notifications_active,
//                         color: const Color(0xFF132C33),
//                         size: 30.0,
//                       ),
//                       title: new Text(snapshot.data.title),
//                       subtitle: new Text(snapshot.data.description),
//                       // isThreeLine: true,
//                       trailing: new Icon(
//                         Icons.arrow_right,
//                         color: const Color(0xFF132C33),
//                         size: 30.0,
//                         semanticLabel: 'Know more about the notice.',
//                       ),
//                     ),
//                   );
//                 });
//           } else if (snapshot.hasError) {
//             print(snapshot.error);
//             return Text(snapshot.error.toString());
//           }
//           return CircularProgressIndicator();
//         },
//       )),
//     );
//   }
// }