import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loyolite/Screens/Certificate_Upload.dart';
import 'package:loyolite/Screens/Education_Add.dart';
import 'package:loyolite/Screens/Experience_Add.dart';
import 'package:loyolite/Screens/Responsiblities_add.dart';
import 'package:loyolite/Screens/Workshop_Certificate_Upload.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Responsibility(),
  ));
}

// TabController _tabController;

@override
class Responsibility extends StatefulWidget {
  @override
  _ResponsibilityState createState() => _ResponsibilityState();
}

class _ResponsibilityState extends State<Responsibility>
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
            elevation: 0,
            //brightness: Brightness.light,
            backgroundColor: Colors.grey[50],
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
          ),
          body: SingleChildScrollView(
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
                      'Inside Loyola',
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
                    title: Text('Public Relations Officer'),
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
                    title: Text('Party Commitee Leader'),
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
                    title: Text('Dean of Science'),
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
                      'Outside Loyola',
                      style: TextStyle(
                          fontSize: text * 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
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
                    title: Text('Event Manager in Rotract Club, Chennai'),
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
                    title: Text('Red Cross Volunteer'),
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
                    title: Text('Music Producer'),
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
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => responsiblityAdd()));
            },
          ),
        ));
  }
}
