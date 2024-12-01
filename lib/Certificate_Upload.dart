import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Academics.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Workshop_Certificate_Upload.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CertificateAdd(),
  ));
}

class CertificateAdd extends StatefulWidget {
  @override
  _CertificateAddState createState() => _CertificateAddState();
}

class _CertificateAddState extends State<CertificateAdd> {
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
                    "Upload Certificates",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add Your Certifications and Upload the Certificates here. ",
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
                  //_Description(),

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
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (builder) => AttachmentContainer());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => academics()));
                      });
                    },
                    child: PrimaryButton(buttonName: "Add Attachments"),
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
      decoration: InputDecoration(labelText: 'Certificate Title (eg. NET) '),
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
      decoration:
          InputDecoration(labelText: 'Description about the Certification'),
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
      decoration: InputDecoration(labelText: 'Certificate Issued Year '),
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

// Attachment Container

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
                      GestureDetector(
                          onTap: () => {_openFileExplorer(), print("Tapped")},
                          child:
                              iconCreation(Icons.add, Colors.grey[600], 'Add')),
                      SizedBox(width: 60),
                      iconCreation(Icons.link, Colors.grey[600], 'Link'),
                      SizedBox(width: 60),
                      // iconCreation(
                      //     Icons.drive_folder_upload, Colors.grey[600], 'Drive')
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

List<PlatformFile> _files;

void uploadImage() async {
  final uri =
      Uri.parse('http://192.168.56.1/teachers_diary/lib/Db/fileupload.php');
  var request = http.MultipartRequest('POST', uri);
  request.fields['name'] = _files.first.path.toString().split("/").last;
  request.fields['path'] = _files.first.path.toString();
  var pic = await http.MultipartFile.fromPath(
      "filePath", _files.first.path.toString());
  request.files.add(pic);
  var response = await request.send();

  if (response.statusCode == 200) {
    print(_files);
    print('Image Uploded');
  } else {
    print('Image Not Uploded');
  }
  // setState(() {});
}

void _openFileExplorer() async {
  _files = (await FilePicker.platform.pickFiles(
          type: FileType.any, allowMultiple: false, allowedExtensions: null))
      .files;

  print('Loaded file path is : ${_files.first.path}');
}
