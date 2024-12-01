import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Education_Add.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/main.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loyolite/models/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:loyolite/Screens/Authentication/authProvider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MyApp(),
      ),
    ),
  );
}

String email = "", password = "";
TextEditingController emailkey = TextEditingController();
TextEditingController passwordkey = TextEditingController();
final GlobalKey<FormState> emailformkey = GlobalKey<FormState>();
final GlobalKey<FormState> passwordformkey = GlobalKey<FormState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Nunito"),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(child: WelcomePage())));
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _pageState = 0;

  var _bgcolor = Colors.white;
  var _headingColor = Colors.white;
  var _subHeadingColor = Colors.black;
  double _createAccHeight = 0;

  double _loginXoffset = 0;
  double _loginYoffset = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  double _loginHeight = 0;

  double _signUpYoffset = 0;

  double _welcomeMargin = 100;
  double windowWidth = 0;
  double windowHeight = 0;

  double _pwdResetHeight = 0;
  double _pwdYOffset = 0;
  double _pwdOpacity = 0;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool keyboardVisible) {
      print('Keyboard visibility update. Is visible: $keyboardVisible');
      _keyboardVisible = keyboardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight - 250;
    _createAccHeight = windowHeight - 300;
    _pwdResetHeight = windowHeight - 300;
    switch (_pageState) {
      case 0:
        _bgcolor = Colors.white;
        _headingColor = Colors.blue;
        _subHeadingColor = Colors.black;
        _loginXoffset = 0;
        _loginYoffset = windowHeight;
        _signUpYoffset = windowHeight;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _welcomeMargin = 100;
        // _loginHeight = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 100;

        break;

      case 1:
        _bgcolor = Colors.blue;
        _headingColor = Colors.white;
        _subHeadingColor = Colors.white;
        _loginXoffset = 0;
        //_loginYoffset = 300;
        _signUpYoffset = windowHeight;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _welcomeMargin = 90;
        _loginHeight = windowHeight;
        _loginYoffset = _keyboardVisible ? 40 : 300;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 100;

        break;

      case 2:
        _bgcolor = Colors.blue;
        _headingColor = Colors.white;
        _subHeadingColor = Colors.white;
        _loginXoffset = 20;
        //_loginYoffset = 270;
        _signUpYoffset = 300;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _pwdOpacity = 0;
        _welcomeMargin = 80;

        _loginYoffset = _keyboardVisible ? 30 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _signUpYoffset = _keyboardVisible ? 55 : 270;
        _createAccHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        break;
    }

    String url = "http://192.168.56.1/Project-Loyolite/lib/Db/signin.php";
    Future<void> signIn() async {
      print(url);
      print(emailkey.text.trim());
      print(passwordkey.text.trim());
      var res = await http.post(Uri.parse(url), body: {
        "email": emailkey.text,
        "password": passwordkey.text,
      });
      var data = jsonDecode(res.body);
      print("data: $data");
      if (data == "Authenticated") {
        Fluttertoast.showToast(
            msg: "Authenticated",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        final snackBar = SnackBar(
          content: Text('Welcome User :)'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      } else if (data == "Auth Error") {
        final snackBar = SnackBar(
          content:
              Text('No Such User Found. \nRecheck your Email ID and Password'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Fluttertoast.showToast(
        //     msg: "No Such User Found. Recheck your Email ID and Password",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.SNACKBAR,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black54,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    }

    return Expanded(
      child: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1500),
            color: _bgcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                      child: Column(
                    children: [
                      AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1500),
                          margin: EdgeInsets.only(top: _welcomeMargin),
                          child: Text('Welcome Loyolite!',
                              style: TextStyle(
                                  color: _headingColor, fontSize: 30))),
                      SizedBox(height: 3),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                            'Loyola Diary allows you to Safely Upload your Certificates and retrieve them, whenever needed. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              color: _subHeadingColor,
                            )),
                      )
                    ],
                  )),
                ),

                // Welcome Container
                SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Image.asset('assets/images/Loyola.png')),
                ),
                Container(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                        //loginformkey.currentState.reset();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      'Get Started!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
                  ),
                ))
              ],
            ),
          ),
          // Login Container

          Form(
            child: Container(
              child: AnimatedContainer(
                padding: EdgeInsets.all(32),
                height: _loginHeight,
                width: _loginWidth,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                transform:
                    Matrix4.translationValues(_loginXoffset, _loginYoffset, 1),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(_loginOpacity),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login to Continue',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    // GetEmail(
                    //   icon: Icons.email,
                    //   hint: "Institutional Mail",
                    //   loginformkey: emailkey,
                    // ),
                    Form(
                      key: emailformkey,
                      child: TextFormField(
                        controller: emailkey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 23),
                          labelText: "Instituitional Mail ID",
                          //focusColor: Colors.blue[800],
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(color: Colors.blue[800], width: 2),
                              borderRadius: BorderRadius.circular(50.0),
                              gapPadding: 7.5),
                        ),
                        //ignore:missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Mail is Required.';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(height: 22.5),
                    Form(
                      key: passwordformkey,
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordkey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 23),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                              // borderSide:
                              //     BorderSide(color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(50.0),
                              gapPadding: 7.5),
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password is Required.';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          password = value;
                        },
                      ),
                    ),

                    // GetPassword(
                    //     icon: Icons.password, hint: "Password", obscure: true),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if ((emailformkey.currentState.validate()) &&
                                  (passwordformkey.currentState.validate())) {
                                signIn();
                              }
                              setState(() {
                                // context.read<AuthenticationService>().signIn(
                                //     email: emailkey.text.trim(),
                                //     password: passwordkey.text.trim(),
                                //     context: context,
                                //     key: loginformkey);
                              });

                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Home()));
                              // //login();
                              // context.read<AuthenticationService>().signIn(
                              //     email: emailkey.text.trim(),
                              //     password: passwordkey.text.trim());
                              // print(emailkey.text.trim());
                              // print(passwordkey.text.trim());
                            },
                            child: PrimaryButton(buttonName: "Login"),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccount1()));
                              });
                            },
                            child: SecButton(
                              secButtonName: "Create an Account",
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GetEmail extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController loginformkey;

  GetEmail({this.icon, this.hint, this.loginformkey, this.obscure = false});
  @override
  _GetEmailState createState() => _GetEmailState();
}

class _GetEmailState extends State<GetEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Container(
        child: Row(
          children: [
            Container(
                width: 80,
                child: Icon(widget.icon, size: 20, color: Color(0xFFBB9B9B9))),
            Expanded(
                child: TextFormField(
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    controller: widget.loginformkey,
                    obscureText: widget.obscure,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      border: InputBorder.none,
                      hintText: widget.hint,
                    )))
          ],
        ),
      ),
    );
  }
}

class GetPassword extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController loginformkey;

  GetPassword({this.icon, this.hint, this.loginformkey, this.obscure = false});
  @override
  _GetEmail1State createState() => _GetEmail1State();
}

class _GetEmail1State extends State<GetPassword> {
  TextEditingController passwordInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Container(
        child: Row(
          children: [
            Container(
                width: 80,
                child: Icon(widget.icon, size: 20, color: Color(0xFFBB9B9B9))),
            Expanded(
                child: TextFormField(
              onChanged: (val) {
                setState(() => password = val);
              },
              controller: widget.loginformkey,
              obscureText: widget.obscure,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// Snackbar
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Publication Uploaded Successfully.'),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Done'),
      ),
    );
  }
}
