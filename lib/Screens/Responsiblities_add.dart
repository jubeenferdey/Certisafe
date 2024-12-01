import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Certificate_Upload.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: responsiblityAdd(),
  ));
}

String ResponsibiltyChoose;
TextEditingController Name = new TextEditingController();
TextEditingController Organization = new TextEditingController();
TextEditingController Duration = new TextEditingController();
TextEditingController Location = new TextEditingController();

class responsiblityAdd extends StatefulWidget {
  @override
  _responsiblityAddState createState() => _responsiblityAddState();
}

class _responsiblityAddState extends State<responsiblityAdd> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> responibiltyAdd() async {
      String url =
          "http://192.168.56.1/Project-Loyolite/lib/Db/uploads/responsibilitiesAdd.php";
      print(url);
      // print(title.text.trim());
      // print(patentID.text.toString());
      // print(year.text.trim());
      var res = await http.post(Uri.parse(url), body: {
        "name": Name.text,
        "organization": Organization.text,
        "duration": Duration.text,
        "location": Location.text,
        "role": ResponsibiltyChoose
      });
      var data = jsonDecode(jsonEncode(res.body));
      print("data: $data");
      if (data == "Success") {
        // Fluttertoast.showToast(
        //     msg: "Data Stored Succesfully",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black54,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        final snackBar = SnackBar(
          content: Text('Responsibilites Added'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Failed to Write Data",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        final snackBar = SnackBar(
          content: Text('Error in Uploading your Responsibilites.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

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
                    "New Responsiblity",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add a New Responsiblity, stating whether it's Inside or Outside Loyola",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  _Name(),
                  SizedBox(height: 10),
                  _Organization(),
                  SizedBox(height: 10),
                  _Duration(),
                  SizedBox(height: 10),
                  _Location(),
                  SizedBox(height: 15),
                  ResponsibilityType(),
                  SizedBox(height: 40),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          responibiltyAdd();
                        });
                      },
                      child: PrimaryButton(buttonName: "Upload"))
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
      controller: Name,
      decoration: InputDecoration(labelText: 'Name'),
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

Widget _Organization() {
  return TextFormField(
      controller: Organization,
      decoration: InputDecoration(labelText: 'Organization'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Organization is Required";
      //   }
      // },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Duration() {
  return TextFormField(
      controller: Duration,
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
      controller: Location,
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

// Responsiblity Type

class ResponsibilityType extends StatefulWidget {
  @override
  _ResponsibilityTypeState createState() => _ResponsibilityTypeState();
}

class _ResponsibilityTypeState extends State<ResponsibilityType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text('Role: ',
                    style: TextStyle(fontSize: 17.5, color: Colors.grey[700])),
                SizedBox(width: 40),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: ResponsibiltyChoose,
                    elevation: 5,
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey[700],
                      fontFamily: 'Nunito',
                    ),
                    items: <String>['Inside Loyola', 'Outside Loyola']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Designation",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.5,
                          //fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'),
                    ),
                    onChanged: (value) {
                      setState(() {
                        ResponsibiltyChoose = value;
                        //_Staff_Designation = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class SnackBarPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             content: Text('Record Updated Successfully.'),
//           );

//           // Find the ScaffoldMessenger in the widget tree
//           // and use it to show a SnackBar.
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: Text('Done'),
//       ),
//     );
//   }
// }
