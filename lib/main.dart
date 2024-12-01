import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:loyolite/Screens/Authentication/authClass.dart';
//import 'package:loyolite/Screens/Authentication/authProvider.dart';
import 'package:provider/provider.dart';
// import 'package:loyolite/Screens/Authentication/Wrapper.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 100),
            child: AnimatedSplashScreen(
              nextScreen: MyApp(),
              splash: Image.asset('assets/images/Loyola.png'),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 305,
              animationDuration: Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          ))));
}

// Buttons

class InputwithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  InputwithIcon({this.icon, this.hint, this.obscure = false});
  @override
  _InputwithIconState createState() => _InputwithIconState();
}

class _InputwithIconState extends State<InputwithIcon> {
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
                child: TextField(
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

class PrimaryButton extends StatefulWidget {
  final String buttonName;

  PrimaryButton({this.buttonName});

  @override
  PrimaryButtonState createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[800], borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class SecButton extends StatefulWidget {
  final String secButtonName;

  SecButton({this.secButtonName});

  @override
  _SecButtonState createState() => _SecButtonState();
}

class _SecButtonState extends State<SecButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.secButtonName,
          style: TextStyle(color: Colors.blue[800], fontSize: 20),
        ),
      ),
    );
  }
}

// Home Controller

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AuthService auth = Provider.of(context).auth;

//     return StreamBuilder(
//       stream: auth.onAuthStateChanged,
//       builder: (context, AsyncSnapshot<User> snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           final bool signedIn = snapshot.hasData;
//           return signedIn ? Home() : WelcomePage();
//         }

//         return Container(
//           color: Colors.black,
//         );
//       },
//     );
//   }
// }

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [Icon(Icons.error), Text("Something Went Wrong !")],
      ),
    ));
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
