import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'register1.dart' ;
import 'login.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';


void main(){
  runApp(Register2());
}

class RegisterUsers extends RegisterClass{
  final String name;
  final String faculty;
  int registrationNo;
  int batch;
  bool isCR;
  bool isStudent;
  String email;
  bool isTeacher;
  final String username;
  final String password;
  // final photo upload

  RegisterUsers({this.name, this.faculty, this.registrationNo, this.batch, this.isCR, this.isStudent, this.email, this.isTeacher, this.username, this.password});

  factory RegisterUsers.fromJson(Map<String, dynamic> json) {
    return RegisterUsers(
      name: json['name'],
      faculty: json['faculty'],
      registrationNo: json['registrationNo'],
      batch: json['batch'],
      isCR: json['isCR'],
      isStudent: json['isStudent'],
      email: json['email'],
      isTeacher: json['isTeacher'],
      username: json['username'],
      password: json['password']

    );
  }

}

Future<RegisterUsers> performRegister(String name, String faculty, int registrationNo, int batch, bool isCR, bool isStudent, String email, bool isTeacher, String username, String password, File file) async {
  print("Registering the user");
  if(isTeacher){
    isStudent= false ;
    isCR = false;
    registrationNo = 1;
    batch = 2018;
  }
  if(isStudent){
    isTeacher = false;
    email = 'test@gmail.com';
  }

  print ("While catching");
  print(file);
  // var url = Uri.parse('http://192.168.100.161:8000');
  // var request = http.MultipartRequest('POST', url);
  // request.fields['name'] = name;
  // request.fields['username'] = username;
  // request.fields['password'] = password;
  // request.fields['is_student'] = http.MultipartRequest.toString(isStudent);
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // request.fields['name'] = name;
  // // request.files.add()

  String photoname = file.path.split('/').last;
  print(photoname);
  print('Happening');
  Response response;
  Dio dio = new Dio();
  var url = 'http://192.168.100.161:8000/register/';

  // final data = {
  //   'name': name,
  //   'username': username,
  //   'password': password,
  //   'is_student': isStudent,
  //   'is_teacher': isTeacher,
  //   'faculty': faculty,
  //   'photo': await MultipartFile.fromFile(
  //     file.path, 
  //     filename: photoname,
  //     contentType: new MediaType("image", "png"),
  //     ),
  //   'student':jsonEncode(<String, dynamic>{
  //     'registration_no': registrationNo,
  //     'batch': batch,
  //     'is_CR': isCR,
  //   }),
  //   'teacher': jsonEncode(<String, dynamic>{
  //     'email': email,
  //   }),
  
  // };

  final student = FormData.fromMap({
      'registration_no': registrationNo,
      'batch': batch,
      'is_CR': isCR,
    });
  

  final teacher =FormData.fromMap({
    'email': email,
  });


// print(data);
// var formData = FormData.fromMap( data );



var formData = FormData.fromMap( {
    "name": name,
    'username': username,
    'password': password,
    'is_student': isStudent,
    'is_teacher': isTeacher,
    'faculty': faculty,
    'photo': await MultipartFile.fromFile(
      file.path, 
      filename: photoname,
      contentType: new MediaType("image", "png"),
      ),
      'student' : student,
      'teacher' : teacher,
    // 'student':FormData.fromMap({
    //   'registration_no': registrationNo,
    //   'batch': batch,
    //   'is_CR': isCR,
    // }),
    // 'teacher': FormData.fromMap({
    //   'email': email,
    // }),
});

print(formData.toString());
print(formData);

 var teach = jsonEncode({
      'email': email,
    });
    print(teacher);
    print(teach);

print('Happening2');
// print(formData.toString());
try {final response = await dio.post(url, data: formData,);
print("Success");
print (response.data);
}
on DioError catch (e) {
  if (e.response != null) {
    print(e.response.data);
    print(e.response.headers);
    print("From if");
    // print(e.response.request);
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    // print(e.request);
    print(e.message);
    print("From else");
  }
  print("Extra");
  print(e.toString());
  
  
  }
print('Happening3');
// print(response.data.toString());




  // var url = Uri.parse('http://192.168.100.161:8000');
  // var client = http.Client();
  // final response1 = await client.post(
  //   Uri.parse('$url/register/'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, dynamic>{
  //     'name': name,
  //     'username': username,
  //     'password': password,
  //     'is_student': isStudent,
  //     'is_teacher': isTeacher,
  //     'faculty': faculty,
  //     // 'photo': photodata,
  //     'student':{
  //       'registration_no': registrationNo,
  //       'batch': batch,
  //       'is_CR': isCR,
  //     },
  //     'teacher': {
  //       'email': email,
  //     },
  //     'registration_no': registrationNo,
  //     'batch': batch,
  //     'is_CR': isCR,
  //     'email': email, 
      
  //   }),
  // );
  //HERE
  // print(response.statusMessage);
  // print(response.statusMessage);
  // if (response.statusCode == 200) {
  //   print(response.data.toString());
  //   return RegisterUsers.fromJson(jsonDecode(response.data));
  // }

  // else{
  //   // print(response.data);
  //   print(response.data.toString());
  //   print('Unable to register User.');
  // }
  return null;
}

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
final TextEditingController _usernamecontroller = TextEditingController();
final TextEditingController _passwordcontroller = TextEditingController();
final TextEditingController _password2controller = TextEditingController();

  @override
    Widget build(BuildContext context) {
    final userDetails = ModalRoute.of(context).settings.arguments as RegisterClass;
    File file;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xFF126E82),
      body : new Container(
        color: const Color(0xFF51C4D3),
        margin: EdgeInsets.all(17),
        child: new Container(
          margin: EdgeInsets.all(15),
          color: const Color(0xFFD8E3E7),
          child: new Column(
            children: <Widget> [
            new Spacer(),
            new Flexible(
                flex:1,
                child: new FractionallySizedBox(
                  widthFactor: 1,
                  // heightFactor: 1,
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    // color: const Color(0xFFFCD5DD),
                    // child: Center(
                      child: Text(
                        "Register to",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Tuffy',
                          fontSize: 25,
                        ),
                        )
                    //  )
                  )
                ),
            ),
            new Flexible(
            flex:2,
            child: new FractionallySizedBox(
              widthFactor: 1,
              // heightFactor: 1,
              child: Container(
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    // color: const Color(0xFFFCD5DD),
                    // child: Center(
                      child: Text(
                        "Hamro Kakshyaa",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.italianno(
                          fontSize: 55,
                          fontWeight: FontWeight.w500,
                        ),
                          // fontSize: 40,
                        ),
                        )
                    //  )
                  )
            
          ),
          new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                // color: const Color(0xFFFCD5DD),
                child: TextField(
                  controller: _usernamecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_box),
                    labelText: 'Username',
                    ),
                )   
              )
            ),
          ),
          new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                // color: const Color(0xFFFCD5DD),
                
                child: TextField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    labelText: 'Password',
                    ),
                )   
              )
            ),
          ),
          new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                // color: const Color(0xFFFCD5DD),
               
                child: TextField(
                    controller: _password2controller,
                    obscureText: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security_sharp),
                    labelText: 'Confirm Password',
                    ),
                )   
              )
            ),
          ),
            new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                // color: const Color(0xFFFCD5DD),
                  child: FloatingActionButton(
                  onPressed: () async {
                    ImagePicker picker  = ImagePicker();
                    final xfile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50, maxHeight: 500, maxWidth: 500);
                    file = File(xfile.path);
                    print(file);
                    print("Here");
                  })
                    
                )   
              )
            ),
          
          
           new Flexible(
           flex:1,
            child: new FractionallySizedBox(
              widthFactor: 1,
              // heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0), 
                decoration: BoxDecoration(
                  color: const Color(0xFF126E82),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: new TextButton(
                  onPressed: (){
                    if(_password2controller.text == _passwordcontroller.text){
                      performRegister(
                        userDetails.name, 
                        userDetails.faculty, 
                        userDetails.registrationNo, 
                        userDetails.batch, 
                        userDetails.isCR, 
                        userDetails.isStudent, 
                        userDetails.email, 
                        userDetails.isTeacher,
                        _usernamecontroller.text, 
                        _passwordcontroller.text,
                        file
                        );
                        print(file);
                        print("While passing");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                              Login()));
                                          // Navigator.pushNamed(context, '/
                    }
                    
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'Tuffy',
                          fontSize: 20,),
                    )
                )
                )
              )
            ),
            // new Spacer(),
           ]
        

        )
      )
    )
    )
    );
  }
      
}