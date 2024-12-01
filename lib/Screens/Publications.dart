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
import 'package:loyolite/Screens/Publications_Add.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Publications(),
  ));
}

class Publications extends StatefulWidget {
  @override
  _PublicationsState createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
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
      body: Material(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 25,
            ),
            Container(
              padding: EdgeInsets.only(left: width / 20),
              child: Text(
                'Publications',
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
              title: Text('Book on A.I'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mother Teresa University'),
                  Text('2008'),
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
              title: Text('The 5AM Club'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mother Teresa University'),
                  Text('2016'),
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
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
            // ListTile(
            //   contentPadding:
            //       EdgeInsets.only(left: width / 20, right: width / 20),
            //   leading: Container(
            //     height: height / 7,
            //     width: 59,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: Colors.black),
            //   ),
            //   horizontalTitleGap: width / 13,
            //   title: Text('M. Phil Computer Science'),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Mother Teresa University'),
            //       Text('2008 Passed out'),
            //     ],
            //   ),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // Divider(
            //   height: 20,
            // ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PublicationAdd()));
        },
      ),
    );
  }
}
