// import 'dart:html';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:dio/dio.dart';

import 'package:hamro_kakshya/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hamro_kakshya/routine/Class.dart';
import 'package:hamro_kakshya/subject/classcode.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<NotesClass>> fetchNotes() async {
  var url = "http://192.168.1.74:8000";
  final response = await http.get(Uri.parse('$url/notes/'));

  if (response.statusCode == 200) {
    List notes = jsonDecode(response.body).cast<Map<String, dynamic>>();
    // print(notes);
    return notes.map((json) => NotesClass.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Notice');
  }
}

// Future<String> uploadNote(String path, String jwt) async {
// var bearer_token = json.decode(jwt)['access'];
// var url = "http://192.168.1.74:8000/notes/create/";
//   var req = http.MultipartRequest('POST', Uri.parse(url));
//   req.headers.addAll({
//     "Content-type": "multipart/form-data",
//     "Authorization": "Bearer $bearer_token"
//   });
//   req.files.add(await http.MultipartFile.fromPath('file', path));

//   var res = await req.send();
//   return res.reasonPhrase;
// }

Future uploadNote(
    String file, String jwt, String class_code, String description) async {
  print(file);

  var bearer_token = json.decode(jwt)['access'];
  var userid = json.decode(jwt)["id"];
  var url = "http://192.168.1.74:8000/notes/create/";
  // String filename = file.path.split('/').last;
  FormData form = new FormData.fromMap({
    "author": userid,
    "description": description,
    "classcode": class_code,
    "file": await MultipartFile.fromFile(file, filename: file.split('/').last),
  });

  var dio = new Dio();
  dio.options.headers['authorization'] = "Bearer $bearer_token";

  var res = await dio.post(url, data: form);
  return res.data;
}

class User {
  final String name, photo;

  User({this.name, this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], photo: json['photo']);
  }
}

class NotesClass {
  final String date, description, file;
  final User author;

  NotesClass({this.date, this.description, this.file, this.author});

  factory NotesClass.fromJson(Map<String, dynamic> json) {
    return NotesClass(
      date: json['date_posted'],
      author: User.fromJson(json['author']),
      description: json['description'],
      file: json['file'],
    );
  }
}

void main() {
  runApp(MaterialApp(home: Note()));
}

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<int> notes = [];
  Future<List<NotesClass>> futureNotes;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    futureNotes = fetchNotes();
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<NotesClass>>(
          future: futureNotes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return NotesContainer(snapshot.data[index]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotesForm()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF126E82),
      ),
    );
  }
}

Widget NotesContainer(NotesClass notes) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(notes.author.photo))),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes.author.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    notes.date.substring(0, 10),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(notes.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notes.file.split("/")[5],
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              IconButton(
                icon: Icon(
                  Icons.download_outlined,
                  size: 30,
                ),
                onPressed: () async {
                  print("Downloading ${notes.file}");
                  final status = await Permission.storage.request();

                  if (status.isGranted) {
                    final externalDir = await getExternalStorageDirectory();
                    print(externalDir.path);

                    final taskid = FlutterDownloader.enqueue(
                      url: notes.file,
                      // url:
                      //     "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                      savedDir: externalDir.path,
                      fileName: notes.file.split("/")[5],
                      showNotification: true,
                      openFileFromNotification: true,
                    );
                  } else {
                    print("Permission denied!");
                  }
                },
              )
            ],
          )
        ],
      ),
    ),
  );
}

class NotesForm extends StatefulWidget {
  String jwt;

  NotesForm() {
    storage.read(key: "jwt").then((value) => jwt = value);
  }

  @override
  _NotesFormState createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final subjectController = TextEditingController();
  final classController = TextEditingController();
  String filename = '';
  String file_error = '';

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    subjectController.dispose();
    classController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF51C4D3),
        title: Text("Upload a note"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 10),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffA7E9F1).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something about the note';
                        }
                        return null;
                      },
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Detail about the note...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF51C4D3), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: classController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Class Code';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Class',
                      hintText: 'Class code: CE18 or CHC17',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF51C4D3), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Click '),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.upload_file,
                          size: 50,
                          color: Color(0xFF51C4D3),
                        ),
                        onPressed: () async {
                          FilePickerResult result = await FilePicker.platform
                              .pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                'pdf',
                                'docx',
                                'doc',
                                'ppt'
                              ]);

                          if (result != null) {
                            File file = File(result.files.single.path);
                            print(file);

                            setState(() {
                              filename = file.path;
                              file_error = "";
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('to upload a file'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(child: Text(filename.split('/').last)),
                  Center(
                      child: Text(
                    file_error,
                    style: TextStyle(color: Colors.red),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF51C4D3),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            String description, classcode;
                            description = descriptionController.text;
                            classcode = classController.text;

                            ClassCode class_code = ClassCode(
                                faculty: classcode,
                                batch: '2018',
                                code: classcode);

                            if (filename != "") {
                              print('uploading a note...');
                              uploadNote(
                                  filename, widget.jwt, classcode, description);
                            } else {
                              setState(() {
                                file_error = "Choose a file...";
                              });
                            }
                          }
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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