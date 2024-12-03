// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/Screens/Responsiblities_add.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loyolite/models/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp());
}

//to store the values
// ignore: unused_element
String _Staff_Email = "";
String _Staff_password = "";
String _Staff_passwordCheck = "";
String Email = "";

// to  check the email check the passwords
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController _passwordCheck = TextEditingController();

class CreateAccount2 extends StatefulWidget {
  const CreateAccount2({super.key});

  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  // signup

  @override
  Widget build(BuildContext context) {
    String url = "http://192.168.56.1/Project-Loyolite/lib/Db/signup.php";
    Future<void> signUp() async {
      // print(url);
      // print(emailkey.text.trim());
      // print(passwordkey.text.trim());
      var res = await http.post(Uri.parse(url), body: {
        "staffID": Staff_ID.toString(),
        "name": Staff_Name,
        "dob": Staff_DOB.toString(),
        "phnum": Staff_PhNum.toString(),
        "address": Staff_Address,
        "shift": Staff_Shift.toString(),
        "role": Staff_Designation,
        "dept": Staff_Dept,
        "gender": Staff_Gender,
        "responsibility": Staff_Responsiblity,
        "maritalStatus": Staff_MarritalSt,
        "password": password.text,
        "email": email.text
      });
      var data = jsonDecode(res.body);
      print("data: $data");
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Data Stored Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        final snackBar = const SnackBar(
          content: Text('Account Created :)'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      } else if (data == "Error") {
        final snackBar = const SnackBar(
          content: Text('There has been an Error Creating your Account.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Create Your ID",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Remember, This is the Credentials you need when you Login again.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  _eMail(),
                  const SizedBox(height: 10),
                  _Password(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  _PasswordCheck(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey2.currentState.validate()) {
                        signUp();
                      }

                      setState(() {
                        // context.read<AuthenticationService>().signUp(
                        //       email: email.text.trim(),
                        //       password: password.text.trim(),
                        //       context: context,
                        //       // key: _formkey2
                        //     );
                        // signUp();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Home()));
                        // _formkey2.currentState.reset();

                        // print(_Staff_Email);
                        // print(_Staff_password);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(50),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: PrimaryButton(
                        buttonName: "Next",
                      ),
                    ),
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

// Mail
Widget _eMail() {
  return TextFormField(
      decoration: const InputDecoration(labelText: 'Institutional Mail ID'),
      keyboardType: TextInputType.text,
      controller: email,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Mail is Required";
      //   }
      // },
      onChanged: (String value) {
        _Staff_Email = value;
        Email = _Staff_Email;
      });
}

//AGE
Widget _Password() {
  return TextFormField(
    maxLength: 15,

    decoration: const InputDecoration(labelText: 'Set a Strong Password'),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: password,
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'Password is Required';
      }
      return null;
    },
    onChanged: (String value) {
      _Staff_password = value;
    },
  );
}

// ignore: non_constant_identifier_names
Widget _PasswordCheck() {
  return TextFormField(
    maxLength: 15,

    decoration: const InputDecoration(
      labelText: 'Re-Enter Password',
    ),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: _passwordCheck,
    onSaved: (value) {
      _Staff_passwordCheck = value;
    },
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'Password is Required';
      }
      if (password.text != _passwordCheck.text) {
        return 'Passwords Donot Match!';
      }
      password.text = _Staff_password;
      return null;
    },
  );
}
