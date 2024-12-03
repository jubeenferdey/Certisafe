import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:certisafe/Screens/Academics.dart';
import 'package:certisafe/Screens/Home/Signup_1.dart';
import 'package:certisafe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:certisafe/Screens/Home/Signup_2.dart';
import 'package:certisafe/Screens/Workshop_Certificate_Upload.dart';
import 'dart:io';
import 'dart:convert';
import 'package:certisafe/Screens/Home/RootScreen.dart';
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

TextEditingController certTitle = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController issuedYear = TextEditingController();

class CertificateAdd extends StatefulWidget {
  const CertificateAdd({super.key});

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
                    "Upload Certificates",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Add Your Certifications and Upload the Certificates here. ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  _Name(), // College Name
                  const SizedBox(height: 10),
                  _Location(), //
                  const SizedBox(height: 10),
                  _Duration(),
                  const SizedBox(height: 10),
                  //_Description(),

                  //_Password(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // _PasswordCheck(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  const SizedBox(height: 60),
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
      controller: certTitle,
      decoration: const InputDecoration(labelText: 'Certificate Title (eg. NET) '),
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
          const InputDecoration(labelText: 'Description about the Certification'),
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
      controller: issuedYear,
      decoration: const InputDecoration(labelText: 'Certificate Issued Year '),
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
      controller: location,
      decoration: const InputDecoration(labelText: 'Location (eg: Chennai)'),
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
  const AttachmentContainer({super.key});

  @override
  _AttachmentContainerState createState() => _AttachmentContainerState();
}

class _AttachmentContainerState extends State<AttachmentContainer> {
  @override
  Widget build(BuildContext context) {
    List<PlatformFile> files;

    Future<void> certDetailsUpload() async {
      String url =
          "http://192.168.56.1/Project-certisafe/lib/Db/uploads/certAdd.php";
      print(url);
      print(certTitle.text.trim());
      print(issuedYear.text.trim());
      print(location.text.trim());
      var res = await http.post(Uri.parse(url), body: {
        "title": certTitle.text,
        "location": location.text,
        "year": issuedYear.text,
        "email": emailkey.text
      });
      var data = jsonDecode(jsonEncode(res.body));
      print("data: $data");
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Data Stored Succesfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Failed to Write Data",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    void uploadImage() async {
      final uri = Uri.parse(
          'http://192.168.56.1/Project-certisafe/lib/Db/uploads/certFileUpload.php');
      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = files.first.path.toString().split("/").last;
      request.fields['path'] = files.first.path.toString();
      var pic = await http.MultipartFile.fromPath(
          "filePath", files.first.path.toString());
      request.files.add(pic);
      var response = await request.send();

      if ((response.statusCode == 200)) {
        print(files);
        print('Image Uploded');

        final snackBar = const SnackBar(
          content: Text('File Uploaded Successfully.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          Navigator.pop(context);
        });
      } else {
        print('Image Not Uploded');
        final snackBar = const SnackBar(
          content: Text('File Uploaded Failed.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          Navigator.pop(context);
        });
      }
    }
    // setState(() {});

    void openFileExplorer() async {
      files = (await FilePicker.platform.pickFiles(
              type: FileType.any,
              allowMultiple: false,
              allowedExtensions: null))
          .files;

      print('Loaded file path is : ${files.first.path}');
      // certDetailsUpload();
      uploadImage();
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => {
                              openFileExplorer(),
                            },
                        child:
                            iconCreation(Icons.add, Colors.grey[600], 'Add')),
                    const SizedBox(width: 60),
                    iconCreation(Icons.link, Colors.grey[600], 'Link'),
                    const SizedBox(width: 60),
                    // iconCreation(
                    //     Icons.drive_folder_upload, Colors.grey[600], 'Drive')
                  ],
                )
              ],
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
      backgroundColor: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
    const SizedBox(height: 5),
    Text(text)
  ]);
}
