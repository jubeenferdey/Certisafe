import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:certisafe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:certisafe/create_account2.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold()));
}

double windowHeight = 0;
double windowWidth = 0;

int _Staff_Shift = 0;

String _Staff_Name = '';
String _Staff_Age = '';
String _Staff_Gender = '';
String _Staff_DOB = '';
String _Staff_PhNum = '';
String _Staff_Email = '';
String _Staff_Address = '';
String _Staff_Dept = '';
String _Staff_Designation = '';
String _Staff_MarritalSt = '';
String _Staff_Responsiblity = '';
String _staff_ID = '';

String valueChoose = "";

class CreateAccount1 extends StatefulWidget {
  const CreateAccount1({super.key});

  @override
  _CreateAccount1State createState() => _CreateAccount1State();
}

class _CreateAccount1State extends State<CreateAccount1> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 1500),
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
                    key: _formkey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Create an Account",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Let us know a bit about you,",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 20),
                            _name(),
                            const SizedBox(height: 20),
                            _Age(),
                            const SizedBox(height: 10),
                            _DOB(),
                            const SizedBox(height: 10),
                            _PhNum(),
                            const SizedBox(
                              height: 10,
                            ),
                            _Responsiblity(),
                            const SizedBox(
                              height: 30,
                            ),
                            _StaffID(),
                            const SizedBox(
                              height: 30,
                            ),
                            _Address(),
                            const SizedBox(
                              height: 30,
                            ),
                            _Designation(),
                            const SizedBox(
                              height: 5,
                            ),
                            _Shift(),
                            _Gender(),
                            const SizedBox(
                              height: 5,
                            ),
                            _MaritalSt(),
                            const SizedBox(
                              height: 30,
                            ),
                            Department(),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (!_formkey.currentState.validate()) {
                                  return;
                                }
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateAccount2()));
                                  _formkey.currentState.reset();
                                });

                                print(_Staff_Name);
                                print(_Staff_Age);
                                print(_Staff_DOB);
                                print(_Staff_PhNum);
                                print(_Staff_Responsiblity);
                                print(_Staff_Address);
                                print(_Staff_Designation);
                                print(_Staff_Shift);
                                print(_Staff_Gender);
                                print(_Staff_MarritalSt);
                                print(_Staff_Dept);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(20),
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
    decoration: const InputDecoration(labelText: 'Name'),
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Name is Required';
    //   }
    // },
    onSaved: (String value) {
      _Staff_Name = value;
    },
  );
}

//AGE
// ignore: non_constant_identifier_names
Widget _Age() {
  return TextFormField(
    maxLength: 2,

    decoration: const InputDecoration(labelText: 'Age'),
    keyboardType: TextInputType.number,
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Age is Required';
    //   }
    // },
    onSaved: (String value) {
      _Staff_Age = value;
    },
  );
}

// DOB
// ignore: non_constant_identifier_names
Widget _DOB() {
  return SafeArea(
    child: Column(
      children: [
        TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(labelText: 'DOB (DD/MM/YYYY)'),

            // ignore: missing_return
            // validator: (String value) {
            //   if (value.isEmpty) {
            //     return 'DOB is Required';
            //   }
            // },
            onSaved: (String value) {
              _Staff_DOB = value;
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
      decoration: const InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.number,
      // ignore: missing_return
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Phone Number is Required";
      //   }
      // },
      onSaved: (String value) {
        _Staff_PhNum = value;
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
                const SizedBox(width: 9.5),
                Text('Role: ',
                    style: TextStyle(fontSize: 17.5, color: Colors.grey[700])),
                const SizedBox(width: 40),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: valueChoose,
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
                    hint: const Text(
                      "Designation",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.5,
                          //fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        valueChoose = value.toString();
                        _Staff_Designation = value.toString();
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
  const Department({super.key});

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
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      hint: const Text('Choose'),
                      dropdownColor: Colors.grey[100],
                      elevation: 5,
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                      ),
                      onChanged: (String newvalue) {
                        setState(() {
                          valueChoosed = newvalue;
                          _Staff_Dept = newvalue;
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
          const InputDecoration(labelText: 'Responsiblity (eg. Dean of Students)'),
      onSaved: (value) {
        _Staff_Responsiblity = value;
      });
}

Widget _StaffID() {
  return TextFormField(
      decoration: const InputDecoration(labelText: 'Staff ID'),
      onSaved: (value) {
        _staff_ID = value.toString();
      });
}

// ADDRESS
// ignore: non_constant_identifier_names
Widget _Address() {
  return TextFormField(
    maxLength: 300,
    keyboardType: TextInputType.streetAddress,
    decoration: const InputDecoration(labelText: 'Address'),
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Address is Required';
    //   }
    // },
    onSaved: (value) {
      _Staff_Address = value.toString();
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
        child: OverflowBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Gender:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            const SizedBox(width: 10),
            Text(
              'Male',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  _Staff_Gender = val as String;
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
                  _Staff_Gender = val as String;
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
      _Staff_Shift = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        child: OverflowBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Shift:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            const SizedBox(width: 30),
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
            const SizedBox(width: 20),
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
        child: OverflowBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Status:',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            const SizedBox(width: 10),
            Text(
              'UnMarried',
              style: TextStyle(color: Colors.grey[700], fontSize: 17.5),
            ),
            Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int val) {
                  setSelectedRadio(val);
                  _Staff_MarritalSt = 'UnMarried';
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
                  _Staff_MarritalSt = 'Married';
                })
          ],
        ),
      )
    ]);
  }
}
