import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Certificate_Upload.dart';
import 'package:loyolite/Screens/Academics.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Conf_CertificateAdd(),
  ));
}

class Conf_CertificateAdd extends StatefulWidget {
  @override
  _Conf_CertificateAddState createState() => _Conf_CertificateAddState();
}

class _Conf_CertificateAddState extends State<Conf_CertificateAdd> {
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
                    "Conference Add",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add Conferences and upload Certificates for the same. ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  _Name(), // College Name
                  SizedBox(height: 10),
                  _Location(), //
                  SizedBox(height: 10),
                  _Duration(),
                  SizedBox(height: 10),
                  _Description(),

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
                        // showModalBottomSheet(
                        //     context: context,
                        //     builder: (builder) => AttachmentContainer());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => academics()));
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
      decoration: InputDecoration(labelText: 'Title of the Event'),
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

Widget _Description() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Description about the Event'),
      keyboardType: TextInputType.streetAddress,
      maxLength: 300,
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
      decoration: InputDecoration(
          labelText: 'Duration (eg: 1 Hour, 3 days for Workshops )'),
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
