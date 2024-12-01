import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Publications.dart';
import 'package:loyolite/Screens/Workshops.dart';
import 'package:flutter/material.dart';
import 'package:loyolite/Screens/Academics.dart';
import 'package:loyolite/Screens/Profile.dart';
import 'package:loyolite/Screens/Responsiblities.dart';
import 'package:loyolite/Screens/Settings.dart';

import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(MaterialApp(home: Home(), theme: ThemeData(fontFamily: "Nunito")));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class Items {
  String title;
  String desc;
  IconData img;

  Widget page;

  Items({this.title, this.desc, this.img, this.page});
}

class HomeState extends State<Home> {
  Future _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do You Want to Exit the App?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("No")),
                TextButton(
                    onPressed: () => Navigator.pop(context, true), //exit(0), //
                    child: Text("Yes"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff392850),

      backgroundColor: Colors.grey[50],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Teacher's Diary",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Dashboard",
                        style: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                // IconButton(
                //   alignment: Alignment.topCenter,
                //   icon: Image.asset(
                //     "assets/notification.png",
                //     width: 24,
                //   ),
                //   onPressed: () {},
                // )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Profile",
      desc: "Update your Profile.",
      page: Profile(),
      img: Icons.person_outline_outlined);

  Items item2 = new Items(
      title: "Academics",
      desc: "Education and Experience.",
      page: academics(),
      img: Icons.school_outlined);

  Items item3 = new Items(
    title: "Workshops",
    desc: "Certificates Upload. ",
    page: workshops(),
    img: Icons.build_rounded,
  );
  Items item4 = new Items(
    title: "Publications",
    desc: "Your Journey",
    page: Publications(),
    img: Icons.book_rounded,
  );

  Items item5 = new Items(
    title: "Responsiblities",
    desc: "Your Individuality",
    page: Responsibility(),
    img: Icons.summarize_outlined,
  );

  Items item6 = new Items(
    title: "Settings",
    desc: "Feedback, Help and more.",
    page: MyHomePage(),
    img: Icons.settings,
  );

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xffE1E2E4),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return TextButton(
              style: flatButtonStyle,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.page));
              },

              // decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //     borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(data.img, size: 40, color: Colors.black),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.desc,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}
