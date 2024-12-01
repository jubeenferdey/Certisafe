import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loyolite/Screens/Education_Add.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/main.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Certificate_Upload.dart';
import 'package:loyolite/Screens/Workshop_Certificate_Upload.dart';
import 'package:flutter/services.dart';
import 'package:loyolite/Screens/Experience_Add.dart';
import 'package:loyolite/Screens/Workshops_Add.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: workshops(),
  ));
}

class workshops extends StatefulWidget {
  @override
  _workshopsState createState() => _workshopsState();
}

class _workshopsState extends State<workshops> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              //_formkey.currentState.reset();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.only(top: 15),
            labelPadding: EdgeInsets.only(top: 20),
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  'WORKSHOPS',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  'SEMINAR',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  'CONFERENCE',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 25,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('Workshop'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 25,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('SEMINAR'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 25,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('CONFERENCES'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      leading: Container(
                        height: height / 7,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                      horizontalTitleGap: width / 13,
                      title: Text('M. Phil Computer Science'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mother Teresa University'),
                          Text('2008 Passed out'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkshopAdd()));
            }),
      ),
    );
  }
}
//Conf_CertificateAdd()

