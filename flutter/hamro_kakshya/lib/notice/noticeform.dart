import 'package:flutter/material.dart';
import 'package:hamro_kakshya/notice/noticeclass.dart';
import 'package:hamro_kakshya/subject/classcode.dart';
import 'package:hamro_kakshya/subject/subjectcode.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: NoticeForm(),
  ));
}

class NoticeForm extends StatefulWidget {
  @override
  _NoticeFormState createState() => _NoticeFormState();
}

class _NoticeFormState extends State<NoticeForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final subjectController = TextEditingController();
  final classController = TextEditingController();

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
        title: Text("Create a Notice"),
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
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Color(0xFF51C4D3),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Text('< Back')),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: Text(
                  //       'Create a Notice',
                  //       style: TextStyle(
                  //           color: Color(0xFF51C4D3),
                  //           fontSize: 35,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Title: Eg. Internal Exam II',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
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
                  Container(
                    height: 200,
                    child: TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the description about the notice.';
                        }
                        return null;
                      },
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Detail about the notice',
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
                    controller: subjectController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Subject Code';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      hintText: 'Subject code: Eg. COMP101 or EDRG110',
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
                            String title, description, subjectcode, classcode;
                            title = titleController.text;
                            description = descriptionController.text;
                            subjectcode = subjectController.text;
                            classcode = classController.text;

                            SubjectCode subject =
                                SubjectCode(code: subjectcode, name: 'Meow');

                            ClassCode class_code = ClassCode(
                                faculty: classcode,
                                batch: '2018',
                                code: classcode);

                            NoticeClass notice = NoticeClass(
                                title: title,
                                description: description,
                                subjectcode: subject,
                                classcode: class_code);

                            Future<NoticeClass> fnotice = createNotice(notice);

                            if (fnotice is Future<NoticeClass>) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Notice Posted!'),
                                backgroundColor: Color(0xff51C4D3),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Notice creation failed!'),
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
      ),
    );
  }
}
