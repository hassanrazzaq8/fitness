import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'nav_pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? email,
      pass,
      name,
      age,
      height,
      height_type,
      weight,
      weight_type,
      contact;
  bool loading = false;
  List height_type_list = ["ft", "cm"];
  List weight_type_list = ["kg", "lbs"];
  bool isLoading = false;

  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  // void addUser(
  //   String uid,
  //   String email,
  //   String password,
  //   String age,
  //   String contact,
  //   String weight,
  // ) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     String res = await FireStorage().uploadUser(
  //       uid,
  //       email,
  //       password,
  //       age,
  //       contact,
  //       weight,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF252BA8), Color(0xFF2F2A6E)]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(400, 60),
                          bottomLeft: Radius.elliptical(400, 60))),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyleHeading,
                        ),
                        Text(
                          "____",
                          style: TextStyleHeading,
                        ),
                        FormTextField(
                          obscuretext: false,
                          inputtype: TextInputType.text,
                          labeltext: "Name",
                          onChanged: (String getName) {
                            name = getName;
                          },
                        ),
                        FormTextField(
                          obscuretext: false,
                          inputtype: TextInputType.number,
                          labeltext: "Age",
                          onChanged: (String getAge) {
                            age = getAge;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: FormTextField(
                                obscuretext: false,
                                inputtype: TextInputType.number,
                                labeltext: "Height",
                                onChanged: (String getheight) {
                                  height = getheight;
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CupertinoPicker(
                                magnification: 1,
                                children: [
                                  Text(
                                    "ft",
                                    style: TextStyleForm,
                                  ),
                                  Text(
                                    "cm",
                                    style: TextStyleForm,
                                  ),
                                ],
                                itemExtent: 30,
                                looping: true,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    height_type = height_type_list[value];
                                    print(height_type);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: FormTextField(
                                obscuretext: false,
                                inputtype: TextInputType.number,
                                labeltext: "Weight",
                                onChanged: (String getWeight) {
                                  weight = getWeight;
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CupertinoPicker(
                                magnification: 1,
                                children: [
                                  Text(
                                    "kg",
                                    style: TextStyleForm,
                                  ),
                                  Text(
                                    "lbs",
                                    style: TextStyleForm,
                                  ),
                                ],
                                itemExtent: 30,
                                looping: true,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    weight_type = weight_type_list[value];
                                    print(weight_type);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        FormTextField(
                          obscuretext: false,
                          inputtype: TextInputType.emailAddress,
                          labeltext: "Email",
                          onChanged: (String getEmail) {
                            email = getEmail;
                          },
                        ),
                        FormTextField(
                          obscuretext: true,
                          inputtype: TextInputType.text,
                          labeltext: "Password",
                          onChanged: (String getPass) {
                            pass = getPass;
                          },
                        ),
                        FormTextField(
                          obscuretext: false,
                          inputtype: TextInputType.number,
                          labeltext: "Contact",
                          onChanged: (String getContact) {
                            contact = getContact;
                          },
                        ),
                        FractionalTranslation(
                          translation: Offset(0, .5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RoundButton(
                                textval: "SignUp",
                                height: 40,
                                width: 120,
                                onpress: () async {
                                  // FocusScope.of(context).unfocus();
                                  setState(() {
                                    loading = true;
                                  });
                                  try {
                                    final newuser = await auth
                                        .createUserWithEmailAndPassword(
                                      email: email!,
                                      password: pass!,
                                    );
                                    if (newuser != null) {
                                      // addUser(
                                      //   auth.currentUser.uid,
                                      //   email,
                                      //   pass,
                                      //   age,
                                      //   contact,
                                      //   weight,
                                      // );
                                      addUserData();
                                      addUserExerData();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }

                                    setState(() {
                                      loading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    setState(() {
                                      loading = false;
                                    });

                                    if (e.code == 'weak-password') {
                                      final snackBar = SnackBar(
                                          content: Text('Weak Password'));
                                      _scaffoldKey.currentState!
                                          .showSnackBar(snackBar);
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                      final snackBar = SnackBar(
                                          content: Text(
                                              'The account already exists for that email.'));
                                      _scaffoldKey.currentState!
                                          .showSnackBar(snackBar);
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      new GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
    );
  }

  Future<void> addUserData() async {
    final users = await firestore
        .collection('users')
        .doc(email)
        .set({
          'id': email,
          'email': email,
          'name': name,
          'age': age,
          'height': height,
          'height_type': height_type,
          'weight': weight,
          'weight_type': weight_type,
          'contact': contact,
          'type': 'user',
          'image': 'N/A',
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    return users;
  }

  Future<void> addUserExerData() async {
    List<String> empty = ['notset'];
    final userexer = await firestore
        .collection('userexer')
        .doc(email)
        .set({
          'id': email,
          'email': email,
          'name': name,
          'age': age,
          'goal': empty.toList(),
          'isgoal': 'notset',
          'kcal': '0',
          'km': '0',
          'minute': '0',
          'workout': '0',
        })
        .then((value) => print("User Exercise data Added"))
        .catchError((error) => print("Failed to add user: $error"));

    return userexer;
  }
}
