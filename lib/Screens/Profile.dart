import 'dart:convert';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "LOYOLA COLLEGE",
        home: Scaffold(
          drawer: const Drawer(),
          body: MaterialApp(
            home: Profile(),
          ),
        ));
  }
}

TextStyle titleStyle = const TextStyle(
    fontSize: 21, letterSpacing: 0.5, fontWeight: FontWeight.w400);
TextStyle subTitleStyle = const TextStyle(fontSize: 15, color: Colors.black54);

// Future<List> getData() async {
//   var url = "http://192.168.0.106/API/getdata.php";
//   final response = await http.get(Uri.parse(url));
//   var dataRecieved = json.decode(response.body);
//   print(dataRecieved);
//   return (dataRecieved);
// }

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // _formkey2.currentState.reset();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Material(
          child: Container(
            color: Colors.white,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width - 10,
                  margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: Container(
                              width: 190.0 / 1.5,
                              height: 190.0 / 1.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: const AssetImage(
                                        "assets/images/Loyola.png",
                                      )))),
                        ),
                      ),
                      Container(
                          child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.transparent.withOpacity(0.03),
                              ),
                              child: const Center(
                                  child: Text(
                                'Profile',
                                style: TextStyle(
                                  //letterSpacing: 2,
                                  color: Colors.black, // Color(0XFF6c757d),

                                  fontSize: 30,
                                ),
                              )))),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2 + 90,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 0, left: 0, top: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  /* gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.white,
                              Colors.lightBlue.shade100,
                              Colors.lightBlue,
                              Colors.blue,
                            ]),*/
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView(
                    padding: const EdgeInsets.only(left: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    children: const <Widget>[
                      SizedBox(height: 10),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.person_rounded,
                          size: 38,
                        ),
                        title: Text(
                          'Name',
                          //style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          'Jubeen Ferdey',

                          // style:
                          //  GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.card_membership,
                          size: 38,
                        ),
                        title: Text(
                          'ID',
                          // style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          '19-UCA-022',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.date_range,
                          size: 38,
                        ),
                        title: Text(
                          'D.O.B',
                          //style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          '18/03/2002',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.female,
                          size: 38,
                        ),
                        title: Text(
                          'Gender',
                          // style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          'Male',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.cast_for_education,
                          size: 38,
                        ),
                        title: Text(
                          'Department',
                          // style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          'Computer Science',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.star_half,
                          size: 38,
                        ),
                        title: Text(
                          'Shift',
                          // style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          'II',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.blue,
                        leading: Icon(
                          Icons.email_rounded,
                          size: 38,
                        ),
                        title: Text(
                          'E-mail ID',
                          // style: GoogleFonts.montserrat(textStyle: titleStyle)
                        ),
                        subtitle: Text(
                          'Chinhchingmangmang@gmail.com',
                          // style:
                          //     GoogleFonts.montserrat(textStyle: subTitleStyle)
                        ),
                      ),
                    ]),
              )
            ]
                //)//
                ),
          ),
        ),
      ),
    );
  }
}
