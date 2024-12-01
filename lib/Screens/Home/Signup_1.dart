import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loyolite/models/user.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold()));
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
// TextEditingController StaffName = new TextEditingController();
// TextEditingController StaffDOB = new TextEditingController();
// TextEditingController StaffPhNum = new TextEditingController();
// TextEditingController StaffDes = new TextEditingController();
// TextEditingController StaffID = new TextEditingController();
// TextEditingController StaffAddress = new TextEditingController();
// TextEditingController StaffName = new TextEditingController();
// TextEditingController StaffName = new TextEditingController();
// TextEditingController StaffName = new TextEditingController();
// TextEditingController StaffName = new TextEditingController();

double windowHeight = 0;
double windowWidth = 0;

int Staff_Shift = 0;

String Staff_Name = "";
// String firstName = "";
// final Staff_Age = new DateTime.now();
// String formatter = DateFormat('yMd').format(Staff_Age);
String Staff_Gender = "";
String Staff_DOB = "";
String Staff_PhNum = "";
String Staff_Email = "";
String Staff_Address = "";
String Staff_Dept = "";
String Staff_Designation;
String Staff_MarritalSt = "";
String Staff_Responsiblity = "";
String Staff_ID = "";

String valueChoose;

class CreateAccount1 extends StatefulWidget {
  @override
  _CreateAccount1State createState() => _CreateAccount1State();
}

class _CreateAccount1State extends State<CreateAccount1> {
  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1500),
            child: Form(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _formkey.currentState.reset();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formkey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Let's get you Started",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Create an Account",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(height: 20),
                            _name(),
                            SizedBox(height: 10),
                            // _Age(),
                            SizedBox(height: 10),
                            _DOB(),
                            SizedBox(height: 10),
                            _PhNum(),
                            SizedBox(
                              height: 10,
                            ),
                            _Responsiblity(),
                            SizedBox(
                              height: 30,
                            ),
                            _StaffID(),
                            SizedBox(
                              height: 30,
                            ),
                            _Address(),
                            SizedBox(
                              height: 30,
                            ),
                            _Designation(),
                            SizedBox(
                              height: 5,
                            ),
                            _Shift(),
                            _Gender(),
                            _MaritalSt(),
                            SizedBox(
                              height: 30,
                            ),
                            Department(),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formkey.currentState.validate()) {
                                  setState(() {
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateAccount2()));
                                      _formkey.currentState.reset();
                                    }
                                  });
                                }

                                print(Staff_Name);
                                print(Staff_DOB);
                                print(Staff_PhNum);
                                print(Staff_Address);
                                print(Staff_Shift);
                                print(Staff_Designation);
                                print(Staff_Dept);
                                print(Staff_Gender);
                                print(Staff_Responsiblity);
                                print(Staff_MarritalSt);
                              },
                              child: Container(
                                margin: EdgeInsets.all(30),
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                child: PrimaryButton(
                                  buttonName: "Next",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Building the Widgets //
// Name
Widget _name() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Name'),
    // ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is Required';
      }
    },
    onChanged: (String value) {
      Staff_Name = value;
      // firstName = value;
    },
  );
}

//AGE
// ignore: non_constant_identifier_names
// Widget _Age() {
//   return TextFormField(
//     maxLength: 2,

//     decoration: InputDecoration(labelText: 'Age'),
//     keyboardType: TextInputType.number,
//     // ignore: missing_return
//     // validator: (String value) {
//     //   if (value.isEmpty) {
//     //     return 'Age is Required';
//     //   }
//     // },
//     onChanged: (String value) {
//       Staff_Age = value;
//     },
//   );
// }

// DOB
// ignore: non_constant_identifier_names
Widget _DOB() {
  return SafeArea(
    child: Column(
      children: [
        TextFormField(
            maxLength: 10,
            decoration: InputDecoration(labelText: 'DOB (DD/MM/YYYY)'),

            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) {
                return 'DOB is Required';
              }
            },
            onChanged: (String value) {
              Staff_DOB = value;
            }),
      ],
    ),
  );
}

// ph num
// ignore: non_constant_identifier_names
Widget _PhNum() {
  return TextFormField(
      maxLength: 10,
      decoration: InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.number,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return "Phone Number is Required";
        }
      },
      onChanged: (String value) {
        Staff_PhNum = value;
      });
}

// DESIGNATION - Dropdown

class _Designation extends StatefulWidget {
  @override
  __DesignationState createState() => __DesignationState();
}

class __DesignationState extends State<_Designation> {
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
                SizedBox(width: 9.5),
                Text('Role: ',
                    style: TextStyle(fontSize: 17.5, color: Colors.grey[700])),
                SizedBox(width: 40),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: Staff_Designation,
                    elevation: 5,
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey[700],
                      fontFamily: 'Nunito',
                    ),
                    items: <String>[
                      'HOD',
                      'Co-Ordinator',
                      'Staff',
                    ].map<DropdownMenuItem<String>>((String value) {
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
                        Staff_Designation = value;
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

class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  String valueChoosed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Department: ',
                    style: TextStyle(fontSize: 17.5, color: Colors.grey[700])),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      hint: Text('Choose'),
                      dropdownColor: Colors.grey[100],
                      elevation: 5,
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                      ),
                      onChanged: (newvalue) {
                        setState(() {
                          valueChoosed = newvalue.toString();
                          Staff_Dept = newvalue.toString();
                        });
                      },
                      items: <String>[
                        'Adv Zoo & Biotech',
                        'B B A',
                        'B Com (CS)',
                        'B Com (Honours)',
                        'B.Com (Accounting & Finance)',
                        'B.Com (Computer Applications)',
                        'Chemistry',
                        'Commerce',
                        'Computer Science',
                        'Data Science',
                        'Economics',
                        'English',
                        'French',
                        'Hindi',
                        'History',
                        'Kaushal Kendra (DDU)',
                        'Mathematics',
                        'Philosophy',
                        'Physical Education',
                        'Physics',
                        'Plant Biology & Biotechnology',
                        'Sanskrit',
                        'School of Human Excellence',
                        'School of Service Learning',
                        'Social Work',
                        'Sociology',
                        'Statistics',
                        'Tamil',
                        'Visual Communication',
                      ].map<DropdownMenuItem<String>>((valueChoosed) {
                        return DropdownMenuItem(
                          value: valueChoosed,
                          child: Text(valueChoosed),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Responsiblity
Widget _Responsiblity() {
  return TextFormField(
      decoration:
          InputDecoration(labelText: 'Responsiblity (eg. Dean of Students)'),
      onChanged: (String value) {
        Staff_Responsiblity = value;
      });
}

Widget _StaffID() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Staff ID'),
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return 'Staff ID is Required';
        }
        return null;
      },
      onChanged: (String value) {
        Staff_ID = value;
      });
}

// ADDRESS
// ignore: non_constant_identifier_names
Widget _Address() {
  return TextFormField(
    maxLength: 300,
    keyboardType: TextInputType.streetAddress,
    decoration: InputDecoration(labelText: 'Address'),
    //ignore: missing_return
    validator: (value) {
      if (value.isEmpty) {
        return 'Address is Required';
      }
    },
    onChanged: (String value) {
      Staff_Address = value;
    },
  );
}

// Radio Buttons
// gender

class _Gender extends StatefulWidget {
  @override
  __GenderState createState() => __GenderState();
}

class __GenderState extends State<_Gender> {
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Gender:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            SizedBox(width: 10),
            Text(
              'Male',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  Staff_Gender = "Male";
                }),
            Text(
              'Female',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  Staff_Gender = "Female";
                })
          ],
        ),
      )
    ]);
  }
}

// Shift
class _Shift extends StatefulWidget {
  @override
  __ShiftState createState() => __ShiftState();
}

class __ShiftState extends State<_Shift> {
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      Staff_Shift = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Shift:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            SizedBox(width: 30),
            Text(
              'I',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                }),
            SizedBox(width: 20),
            Text(
              'II',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                })
          ],
        ),
      )
    ]);
  }
}

// Marital Status
class _MaritalSt extends StatefulWidget {
  @override
  __MaritalStState createState() => __MaritalStState();
}

class __MaritalStState extends State<_MaritalSt> {
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Status:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            SizedBox(width: 20),
            Text(
              'UnMarried',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  Staff_MarritalSt = 'UnMarried';
                }),
            Text(
              'Married',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  Staff_MarritalSt = 'Married';
                })
          ],
        ),
      )
    ]);
  }
}
