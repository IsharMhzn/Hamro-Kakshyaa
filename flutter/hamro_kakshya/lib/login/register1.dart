import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamro_kakshya/login/register2.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';
import 'login.dart';

void main() {
  runApp(Register1());
}

class RegisterClass {
  final String name;
  final String faculty;
  int registrationNo;
  int batch;
  bool isCR;
  bool isStudent;
  String email;
  bool isTeacher;

  RegisterClass(
      {this.name,
      this.faculty,
      this.registrationNo,
      this.batch,
      this.isCR,
      this.isStudent,
      this.email,
      this.isTeacher});
}

class Register1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFF126E82),
            body: new Container(
                color: const Color(0xFF51C4D3),
                margin: EdgeInsets.all(17),
                child: new Container(
                    margin: EdgeInsets.all(15),
                    color: const Color(0xFFD8E3E7),
                    child: new Column(children: <Widget>[
                      // new Spacer(),
                      new Flexible(
                        flex: 1,
                        child: new FractionallySizedBox(
                            widthFactor: 1,
                            // heightFactor: 1,
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  "Welcome to",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Tuffy',
                                    fontSize: 25,
                                  ),
                                )
                                //  )
                                )),
                      ),
                      new Flexible(
                          flex: 2,
                          child: new FractionallySizedBox(
                              widthFactor: 1,
                              // heightFactor: 1,
                              child: Container(
                                // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                              )),
                      new Flexible(
                        flex: 11,
                        child: new FractionallySizedBox(
                          widthFactor: 1,
                          // heightFactor: 1,
                          child: RegisterUsers(),
                        ),
                      ),
                      // RegisterUsers(),

                      // new Spacer(),
                    ])))));
  }
}

class RegisterUsers extends StatefulWidget {
  @override
  _RegisterUsersState createState() => _RegisterUsersState();
}

class _RegisterUsersState extends State<RegisterUsers> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _facultycontroller = TextEditingController();
  final TextEditingController _registrationNocontroller =
      TextEditingController();
  final TextEditingController _batchcontroller = TextEditingController();
  bool _isCRcontroller = false;
  final TextEditingController _emailcontroller = TextEditingController();
  String fieldError = '';

  bool _swapUsers = false;
  bool _isCR = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget registerStudent() {
      return Column(children: <Widget>[
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 5),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _namecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 5),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _facultycontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                      labelText: 'Faculty',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 5),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _registrationNocontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.add_outlined),
                      labelText: 'Registration number',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 5),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _batchcontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.school),
                      labelText: 'Batch',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                // color: const Color(0xFFFCD5DD),
                child: new CheckboxListTile(
                  checkColor: Colors.black,
                  activeColor: Colors.cyan,
                  value: this._isCR,
                  title: Text('Are you a CR?',
                      style: TextStyle(color: Colors.grey[700])),
                  secondary: new Icon(Icons.question_answer_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      this._isCR = value;
                      if (this._isCR) {
                        _isCRcontroller = true;
                      }
                    });
                  },
                ),
              )),
        ),
        Center(
            child: Text(
          fieldError,
          style: TextStyle(color: Colors.red, fontSize: 15),
        )),
        SizedBox(
          height: 10,
        ),
        // new Spacer(),
        new Flexible(
            flex: 1,
            child: new FractionallySizedBox(
                widthFactor: 1,
                // heightFactor: 1,
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF126E82),
                        borderRadius: BorderRadius.circular(20)),
                    child: new TextButton(
                        onPressed: () {
                          if (_namecontroller.text != '' &&
                              _facultycontroller.text != '' &&
                              _registrationNocontroller.text != '' &&
                              _batchcontroller.text != '') {
                            setState(() {
                              fieldError = '';
                            });
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Register2(),
                                    settings: RouteSettings(
                                        arguments: RegisterClass(
                                      name: _namecontroller.text,
                                      faculty: _facultycontroller.text,
                                      registrationNo: int.parse(
                                          _registrationNocontroller.text),
                                      batch: int.parse(_batchcontroller.text),
                                      isCR: _isCRcontroller,
                                      isStudent: true,
                                      isTeacher: false,
                                    ))));
                          } else {
                            setState(() {
                              fieldError = 'All the fields are compulsory.';
                            });
                          }
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tuffy',
                            fontSize: 20,
                          ),
                        ))))),
        // new Spacer(),
      ]);
    }

    Widget registerTeacher() {
      return Column(children: <Widget>[
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 20, 32, 0),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _namecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(32, 20, 32, 0),
                  // color: const Color(0xFFFCD5DD),
                  child: TextField(
                    controller: _facultycontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                      labelText: 'Faculty',
                    ),
                  ))),
        ),
        new Flexible(
          flex: 1,
          child: new FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
                margin: EdgeInsets.fromLTRB(32, 20, 32, 0),
                // color: const Color(0xFFFCD5DD),
                child: TextField(
                    controller: _emailcontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email'))),
          ),
        ),
        Center(
            child: Text(
          fieldError,
          style: TextStyle(color: Colors.red, fontSize: 15),
        )),
        SizedBox(
          height: 10,
        ),
        new Flexible(
            flex: 1,
            child: new FractionallySizedBox(
                widthFactor: 1,
                // heightFactor: 1,
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF4AAEBB),
                        borderRadius: BorderRadius.circular(20)),
                    child: new TextButton(
                        onPressed: () {
                          if (_namecontroller.text != '' &&
                              _facultycontroller.text != '' &&
                              _emailcontroller.text != '') {
                            setState(() {
                              fieldError = '';
                            });
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Register2(),
                                    settings: RouteSettings(
                                        arguments: RegisterClass(
                                      name: _namecontroller.text,
                                      faculty: _facultycontroller.text,
                                      email: _emailcontroller.text,
                                      isTeacher: true,
                                      isStudent: false,
                                    ))));
                          } else {
                            setState(() {
                              fieldError = 'All the fields are compulsory..';
                            });
                          }
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tuffy',
                            fontSize: 20,
                          ),
                        ))))),
      ]);
    }

    final userToggleBtn = Container(
      margin: EdgeInsets.only(top: 2.0, bottom: 5.0),
      alignment: Alignment.center,
      child: ToggleSwitch(
        cornerRadius: 4.0,
        totalSwitches: 2,
        minWidth: 137,
        // minHeight: MediaQuery.of(context).size.height,
        minHeight: 40,
        fontSize: 20.0,
        initialLabelIndex: _swapUsers ? 0 : 1,
        activeBgColors: [
          [Color(0xFF126E82)],
          [Color(0xFF4AAEBB)]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: const Color(0xFFD8E3E7),
        inactiveFgColor: Colors.black54,
        borderColor: [Colors.grey[350]],
        animate:
            true, // with just animate set to true, default curve = Curves.easeIn
        curve: Curves.bounceInOut,
        labels: ['As Student', 'As Teacher'],
        onToggle: (index) {
          setState(() {
            _swapUsers = !_swapUsers;
          });
        },
      ),
    );

    var swapTile = new Container(
      child: _swapUsers ? registerStudent() : registerTeacher(),
    );

    final registerWidget = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Card(
            // color: Colors.white,
            color: const Color(0xFFD8E3E7),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: userToggleBtn,
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      // padding: EdgeInsets.only(top:3),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: swapTile, //getCustomContainer(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton.extended(
                        label: Text("Login Directly",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tuffy',
                            fontSize: 17,
                          )
                        
                        ),
                        tooltip: "Jump to Login page",
                        backgroundColor: const Color(0xFF126E82),
                        foregroundColor: Colors.white,
                        hoverColor: Colors.cyan,
                        icon: Icon(
                          Icons.login_rounded,
                          size: 30,    
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                Login()));
                        })),
                      SizedBox(
                        height:10
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: registerWidget,
          ),
        ],
      ),
    );

    return body;
  }
}
