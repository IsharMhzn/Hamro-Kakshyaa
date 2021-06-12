import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: NoticeDetail()));
}

class NoticeDetail extends StatefulWidget {
  const NoticeDetail({Key key}) : super(key: key);

  @override
  _NoticeDetailState createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xFF51C4D3),
          centerTitle: true,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TextButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: Text('<-')),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '< Prev',
                        style: TextStyle(
                            color: Color(0xff207E98),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Next >',
                          style: TextStyle(
                              color: Color(0xff207E98),
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                    )
                  ],
                ),
                Divider(
                  color: Color(0xffDEEDEE),
                  thickness: 3,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subject: COMP 303',
                    style: TextStyle(
                        color: Color(0xff207E98),
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Color(0xffDEEDEE),
                  thickness: 3,
                ),
                Container(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title',
                      style: TextStyle(
                          color: Color(0xff207E98),
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    )),
                Container(
                  padding: EdgeInsets.all(6),
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Color(0xff51C4D3), width: 2)),
                  child: Text(
                    "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
                        "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
                        "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                        "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                        "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                        "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                        "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                        "8 Description that is too long in text format(Here Data is coming from API)" +
                        "9 Description that is too long in text format(Here Data is coming from API)" +
                        "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                        "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                        "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                        "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                        "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                        "8 Description that is too long in text format(Here Data is coming from API)" +
                        "9 Description that is too long in text format(Here Data is coming from API)" +
                        "9 Description that is too long in text format(Here Data is coming from API)" +
                        "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                        "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                        "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                        "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                        "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                        "8 Description that is too long in text format(Here Data is coming from API)" +
                        "9 Description that is too long in text format(Here Data is coming from API)" +
                        "10 Description that is too long in text format(Here Data is coming from API)",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  height: 35,
                  alignment: Alignment.centerRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.person),
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Text(
                  'Time: 2:00 pm',
                  style: TextStyle(
                      color: Color(0xff207E98),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date: 2021-06-25',
                  style: TextStyle(
                      color: Color(0xff207E98),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
