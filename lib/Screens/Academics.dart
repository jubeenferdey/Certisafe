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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: academics(),
  ));
}

// ignore: unused_element
// TabController _tabController;

@override
class academics extends StatefulWidget {
  @override
  _academicsState createState() => _academicsState();
}

class _academicsState extends State<academics>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
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
              controller: _tabController,
              indicatorPadding: EdgeInsets.only(top: 15),
              labelPadding: EdgeInsets.only(top: 20),
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'QUALIFICATION',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Tab(
                  child: Text(
                    'EXPERIENCE',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Text(
                          'Education',
                          style: TextStyle(
                            fontSize: text * 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                      SizedBox(
                        height: height / 70,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Text(
                          'Certification',
                          style: TextStyle(
                              fontSize: text * 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
                        contentPadding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
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
          floatingActionButton: _tabController.index == 0
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (builder) => AttachmentContainer());
                  },
                )
              : FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExperienceAdd()));
                  },
                ),
        ));
  }
}

// Attachment Container

class AttachmentContainer extends StatefulWidget {
  @override
  _AttachmentContainerState createState() => _AttachmentContainerState();
}

class _AttachmentContainerState extends State<AttachmentContainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EducationAdd()));
                            });
                          },
                          child: Container(
                              child: PrimaryButton(
                                  buttonName: 'Education Upload'))),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CertificateAdd()));
                          });
                        },
                        child: Container(
                          child: SecButton(
                            secButtonName: 'Certification Upload',
                          ),
                        ),
                      )
                    ],
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

class AttachmentContainer1 extends StatefulWidget {
  @override
  _AttachmentContainer1State createState() => _AttachmentContainer1State();
}

class _AttachmentContainer1State extends State<AttachmentContainer1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExperienceAdd()));
                          });
                        },
                      )
                    ],
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
