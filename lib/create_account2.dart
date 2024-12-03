import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:certisafe/Responsiblities_add.dart';
import 'package:certisafe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:certisafe/create_account1.dart';

void main() {
  runApp(const MaterialApp());
}

String _Staff_Email = '';
String _Staff_password = '';
String _Staff_passwordCheck = '';

TextEditingController _password = TextEditingController();
TextEditingController _passwordCheck = TextEditingController();

class CreateAccount2 extends StatefulWidget {
  const CreateAccount2({super.key});

  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            _formkey2.currentState.reset();
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
                      if (!_formkey2.currentState.validate()) {
                        return;
                      }
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => responsiblityAdd()));
                        _formkey2.currentState.reset();

                        print(_Staff_Email);
                        print(_Staff_password);
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
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Mail is Required";
      //   }
      // },
      onSaved: (String value) {
        _Staff_Email = value;
      });
}

//AGE
Widget _Password() {
  return TextFormField(
    maxLength: 15,

    decoration: const InputDecoration(labelText: 'Set a Strong Password'),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: _password,
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Password is Required';
    //   }
    // },
    onSaved: (String value) {
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
    onSaved: (String value) {
      _Staff_passwordCheck = value;
    },
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Password is Required';
    //   }
    //   if (_password.text != _passwordCheck.text) {
    //     return 'Passwords Donot Match!';
    //   }
    //   _password.text = _Staff_password;
    // },
  );
}
