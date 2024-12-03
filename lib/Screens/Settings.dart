import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
// import 'package:loyolite/Screens/Authentication/Firebase.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
//import 'package:loyolite/Screens/Authentication/authProvider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'Settings_Alert_dialog.dart';
import 'package:provider/provider.dart';

void main() => runApp(_Settings());

class _Settings extends StatefulWidget {
  @override
  __SettingsState createState() => __SettingsState();
}

class __SettingsState extends State<_Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue[500],
        primaryColorLight: const Color(0xFFFBE0E6),
        //accentColor: Color(0xFF1B1F32),
      ),
      home: _Settings(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Settings';
  bool tappedYes = false;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.blue.shade600,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  void _rateAndReviewApp() async {
    final inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      print('request actual review from store');
      inAppReview.requestReview();
    } else {
      print('open actual store listing');

      inAppReview.openStoreListing(
        appStoreId: '<your app store id>',
        microsoftStoreId: '<your microsoft store id>',
      );
    }
  }

  // show the rating dialog
  void _showRatingDialog() {
    final dialog = RatingDialog(
      // your app's name?
      title: const Text('LOYOLA '),
      // encourage your user to leave a high rating?
      message: const Text(
          'Tap a star to set your rating.Your valuable comments keeps us going'),
      // your app's logo?
      image: Image.network(
          "https://upload.wikimedia.org/wikipedia/en/thumb/1/13/Loyola_College_Chennai_-_Coat_of_arms.png/220px-Loyola_College_Chennai_-_Coat_of_arms.png"),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          _rateAndReviewApp();
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => dialog,
    );
  }

  void alertFaq(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {},
      child: const Text("OK"),
      // onPressed: () {
      //   Navigator.pop(context);
      // },
    );

    var alert = AlertDialog(
      title: const Text(
        "F.A.Q",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "1. Is the app good? - Yes\n2. Is the app Working?  - Perfect",
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(children: [
        const SizedBox(
          height: 17,
        ),
        TextButton(
            style: flatButtonStyle,
            onPressed: () => showAboutPage(
                  context: context,
                  values: {
                    'version': '1.0',
                    'year': DateTime.now().year.toString(),
                  },
                  applicationLegalese:
                      'Copyright © LOYOLA COLLEGE,Chennai, {{ year }}',
                  applicationDescription: const Text(
                      'LOYOLA DIARY App designed my BCA final years(2019-22)'),
                  children: <Widget>[
                    LicensesPageListTile(
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                  applicationIcon: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/en/thumb/1/13/Loyola_College_Chennai_-_Coat_of_arms.png/220px-Loyola_College_Chennai_-_Coat_of_arms.png"),
                  ),
                ),
            child: const Align(
              alignment: Alignment.center,
              child: Text("About"),
            )),
        TextButton(
            style: flatButtonStyle,
            onPressed: () => alertFaq(context),
            child: const Align(
              alignment: Alignment.center,
              child: Text("F A Q"),
            )),
        TextButton(
            style: flatButtonStyle,
            onPressed: () => _showRatingDialog(),
            child: const Align(
              alignment: Alignment.center,
              child: Text("Feedback"),
            )),
        TextButton(
          style: flatButtonStyle,
          onPressed: () {
            final snackBar = const SnackBar(content: Text('Logged Out Successfully'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // context.read<AuthenticationService>().signOut(context: context);
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));

            // final action = await AlertDialogs.yesCancelDialog(
            //     context, 'Logout', 'Are you sure?');
            // if (action == DialogsAction.yes) {
            //   context.read<AuthenticationService>().signOut();
            //   if (Navigator.of(context).canPop()) {
            //     Navigator.of(context).pop();
            //   }
            //   setState(
            //     () => tappedYes = true,
            //   );
            // } else {
            //   setState(() => tappedYes = false);
            // }
          },
          child: const Text('Logout'),
        ),
      ])),
    );
  }
}
