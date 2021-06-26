import 'package:flutter/material.dart';
import 'package:hamro_kakshya/notice/noticeclass.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: NoticeDetail()));
}

class NoticeDetail extends StatefulWidget {
  final List<NoticeClass> notices;
  int index;

  NoticeDetail({this.notices, this.index});

  @override
  _NoticeDetailState createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(40),
      //   child: AppBar(
      //     backgroundColor: Color(0xFF51C4D3),
      //     centerTitle: true,
      //   ),
      // ),
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
                      onPressed: () {
                        setState(() {
                          if (widget.index >= 1) {
                            widget.index--;
                          } else {
                            widget.index = widget.notices.length - 1;
                          }
                        });
                      },
                      child: Text(
                        '< Prev',
                        style: TextStyle(
                            color: Color(0xff207E98),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back',
                          style: TextStyle(
                              color: Color(0xff207E98),
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (widget.index < widget.notices.length - 1) {
                            widget.index++;
                          } else {
                            widget.index = 0;
                          }
                        });
                      },
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
                    'Subject: ${widget.notices[widget.index].subjectcode.code}',
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
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.notices[widget.index].title,
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
                    widget.notices[widget.index].description,
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
                  'Time: ${widget.notices[widget.index].time}',
                  style: TextStyle(
                      color: Color(0xff207E98),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date: ${widget.notices[widget.index].date}',
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
