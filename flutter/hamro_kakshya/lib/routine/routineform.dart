import 'package:flutter/material.dart';
import 'package:hamro_kakshya/appbar.dart';
import 'package:hamro_kakshya/subject/classcode.dart';
import 'package:hamro_kakshya/subject/subjectcode.dart';
import './Class.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: RoutineForm(),
  ));
}

class RoutineForm extends StatefulWidget {
  @override
  _RoutineFormState createState() => _RoutineFormState();
}

class _RoutineFormState extends State<RoutineForm> {
  final _formKey = GlobalKey<FormState>();
  final subjectTeacherController = TextEditingController();
  final ClassCodeController = TextEditingController();
  final SubjectCodeController = TextEditingController();
  final linkController = TextEditingController();
  final room_noController = TextEditingController();
  final timeController = TextEditingController();
  final daysController = TextEditingController();

  @override
  void dispose() {
    subjectTeacherController.dispose();
    ClassCodeController.dispose();
    linkController.dispose();
    timeController.dispose();
    room_noController.dispose();
    SubjectCodeController.dispose();
    daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF51C4D3),
        title: Text("Create a Routine"),
      ),
      body: Container(
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
                TextFormField(
                  controller: SubjectCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'SubjectCode',
                    hintText: "COMP 206",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: subjectTeacherController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Subject Teacher',
                    hintText: "Ishar Maharajan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ClassCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'ClassCode ',
                    hintText: "CE 2018",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: linkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Class link  ',
                    hintText: "https://meet.google.com/rwq-zwqx-cbr",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: room_noController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Class Room Number',
                    hintText: "404",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: timeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Class time',
                    hintText: "9-00",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: daysController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Days ',
                    hintText: "Sun-Mon-'Name of all days'",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF51C4D3), width: 3.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF51C4D3),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          String subjectTeacher,
                              classCode,
                              link,
                              time,
                              subjectCode,
                              room_no,
                              days;

                          subjectCode = SubjectCodeController.text;
                          subjectTeacher = subjectTeacherController.text;
                          classCode = ClassCodeController.text;
                          link = linkController.text;
                          time = timeController.text;
                          room_no = room_noController.text;
                          days = daysController.text;

                          SubjectCode subject =
                              SubjectCode(code: subjectCode, name: 'Meow');

                          ClassCode class_code = ClassCode(
                              faculty: classCode,
                              batch: '2018',
                              code: classCode);

                          RoutineClass routine = RoutineClass(
                            subjectTeacher: subjectTeacher,
                            subjectcode: subject,
                            classcode: class_code,
                            link: link,
                            time: time,
                            room_no: room_no,
                            days: days,
                          );

                          Future<RoutineClass> froutine = createRoutne(routine);
                          if (froutine is Future<RoutineClass>) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Routine Posted!'),
                              backgroundColor: Color(0xff51C4D3),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Routine creation failed!'),
                              backgroundColor: Color(0xff51C4D3),
                            ));
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
    );
  }
}
