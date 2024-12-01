import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Workshop_Certificate_Upload.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Certificate_Upload.dart';
import 'package:loyolite/Screens/Academics.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WorkshopAdd(),
  ));
}

String eventLevel;

TextEditingController Title = new TextEditingController();
TextEditingController Lcoation = new TextEditingController();
TextEditingController Duration = new TextEditingController();
TextEditingController Description = new TextEditingController();
// TextEditingController EventLevel = new TextEditingController();

class WorkshopAdd extends StatefulWidget {
  @override
  _WorkshopAddState createState() => _WorkshopAddState();
}

class _WorkshopAddState extends State<WorkshopAdd> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> eventUpload() async {
      String url =
          "http://192.168.56.1/Project-Loyolite/lib/Db/uploads/eventAdd.php";
      print(url);
      // print(title.text.trim());
      // print(patentID.text.toString());
      // print(year.text.trim());
      var res = await http.post(Uri.parse(url), body: {
        "title": Title.text,
        "location": Lcoation.text,
        "duration": Duration.text,
        "description": Description.text,
        "eventLevel": eventLevel
      });
      var data = jsonDecode(res.body.toString());
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
          content: Text('Event Details Added'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (data == "Error") {
        // Fluttertoast.showToast(
        //     msg: "Failed to Write Data",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black54,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        final snackBar = SnackBar(
          content: Text('Error in Uploading your Event Details.'),
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
                    "Workshops, Seminars & Conferences",
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
                  WorkshopType(),

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
                        eventUpload();
                        // showModalBottomSheet(
                        //     backgroundColor: Colors.transparent,
                        //     context: context,
                        //     builder: (builder) => AttachmentContainer());
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //     builder: (context) => Conf_CertificateAdd()));
                        // _formkey2.currentState.reset();
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
      controller: Title,
      decoration: InputDecoration(labelText: 'Title of the Event'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Name is Required";
      //   }
      // },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Description() {
  return TextFormField(
      controller: Description,
      decoration: InputDecoration(labelText: 'Description about the Event'),
      keyboardType: TextInputType.streetAddress,
      maxLength: 300,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Department is Required";
      //   }
      // },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Duration() {
  return TextFormField(
      controller: Duration,
      decoration: InputDecoration(
          labelText: 'Duration (eg: 1 Hour, 3 days for Workshops )'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Duration is Required";
      //   }
      // },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Location() {
  return TextFormField(
      controller: Lcoation,
      decoration: InputDecoration(labelText: 'Location (eg: Chennai)'),
      keyboardType: TextInputType.text,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Location is Required";
      //   }
      // },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

//AGE

class WorkshopType extends StatefulWidget {
  @override
  _WorkshopTypeState createState() => _WorkshopTypeState();
}

class _WorkshopTypeState extends State<WorkshopType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                //SizedBox(width: 9.5),
                Text('Standard: ',
                    style: TextStyle(fontSize: 17.5, color: Colors.grey[700])),
                SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: eventLevel,
                    elevation: 5,
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey[700],
                      fontFamily: 'Nunito',
                    ),
                    items: <String>[
                      'Local',
                      'State',
                      'National',
                      'International',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Level",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.5,
                          //fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        eventLevel = value;
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

class AttachmentContainer extends StatefulWidget {
  @override
  _AttachmentContainerState createState() => _AttachmentContainerState();
}

class _AttachmentContainerState extends State<AttachmentContainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconCreation(Icons.add, Colors.grey[600], 'Add'),
                      SizedBox(width: 60),
                      iconCreation(Icons.link, Colors.grey[600], 'Link'),
                      SizedBox(width: 60),
                      iconCreation(
                          Icons.drive_folder_upload, Colors.grey[600], 'Drive')
                    ],
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

Widget iconCreation(IconData icon, Color color, String text) {
  return Column(children: [
    CircleAvatar(
      radius: 30,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      backgroundColor: color,
    ),
    SizedBox(height: 5),
    Text(text)
  ]);
}
