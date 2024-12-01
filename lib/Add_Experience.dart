import 'package:flutter/cupertino.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/create_account2.dart';
import 'package:loyolite/Certificate_Upload.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExperienceAdd(),
  ));
}

class ExperienceAdd extends StatefulWidget {
  @override
  _ExperienceAddState createState() => _ExperienceAddState();
}

class _ExperienceAddState extends State<ExperienceAdd> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            _formkey2.currentState.reset();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Experience",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Include your Experience in Teaching. ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  _Name(), // College Name
                  SizedBox(height: 10),
                  _Department(), //
                  SizedBox(height: 10),
                  _Duration(),
                  SizedBox(height: 10),
                  _Location(),
                  //_Password(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // _PasswordCheck(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  SizedBox(height: 60),
                  GestureDetector(
                    onTap: () {
                      if (!_formkey2.currentState.validate()) {
                        return;
                      }
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CertificateAdd()));
                        _formkey2.currentState.reset();
                      });
                    },
                    child: PrimaryButton(buttonName: "Upload"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Mail
Widget _Name() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'College Name'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Name is Required";
      //   }
      // },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Department() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Department'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Department is Required";
      //   }
      // },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Duration() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Duration (eg: 2011-2012)'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Duration is Required";
      //   }
      // },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Location() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Location (eg: Chennai)'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Location is Required";
      //   }
      // },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

//AGE
