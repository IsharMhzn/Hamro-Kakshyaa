import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hamro_kakshya/main.dart';
import 'dart:async';

class User{
  String name,faculty,photo;

  User({this.name,this.faculty,this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      faculty: json['faculty'],
      photo: json['photo'],
    );
  }
}


Future<User> fetchUser(http.Client client, String jwt) async {
  print("Fetching User Profile.");
  var bearerToken = json.decode(jwt)["access"];
  var id = json.decode(jwt)["id"];
  var url = "http://192.168.100.161:8000/user/${id}";

  final response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $bearerToken"});
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load profile information.');
  }
}

// ignore: must_be_immutable
class AppBarProfile extends StatefulWidget  implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(56);
  String jwt;

  AppBarProfile({this.jwt});
  @override
  _AppBarProfileState createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  Future<User> futureUser;

  @override
  void initState() {
    futureUser = fetchUser(http.Client(), widget.jwt);   
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
                  title: 
                     FutureBuilder(
                        future: futureUser,
                        builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data= snapshot.data;
                              return  Text(
                              "${data.name} \n${data.faculty}",    
                              // "Hello",           
                              style: TextStyle(color: const Color(0xFF132C33)),
                              );
                              
                            } else if (snapshot.hasError) {
                              print("Error Occured.");
                              print(snapshot.error.toString());
                              return Text(snapshot.error.toString());
                            }
                          return Center(
                              child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
                          ));
                        },
                      ),
                 
                  backgroundColor: const Color(0xFF51C4D3),
                  leading: GestureDetector(
                      onTap: () {
                        print('The profile icon is clicked.');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 0, 3),
                        child: FutureBuilder(
                          future: futureUser,
                          builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data= snapshot.data;
                                  if(data.photo!=null){
                                    return  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(data.photo))),
                                        );}
                                    else{
                                      print("Unable to find photo");
                                    }                            
                              } else if (snapshot.hasError) {
                                print("Error Occured.");
                                print(snapshot.error.toString());
                                return Text(snapshot.error.toString());
                              }
                            return Center(
                                child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Color(0xFF126E82)),
                            ));
                          },
                        ),
                      )),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: FloatingActionButton(
                        mini: true,
                        tooltip: "Logout",
                        backgroundColor: const Color(0xFF51C1D3),
                        foregroundColor: const Color(0xFF132C33),
                        hoverColor: Colors.cyan,
                        child: Icon(
                          Icons.logout,
                          size: 30,    
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        // hoverColor: const Color(0xFF126E82),
                      ),
                    )
                  ],
                );
   

  }
}