import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/screens/nav_pages/home_page.dart';
import 'package:fitnessapp/screens/sign_up.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitnessapp/components/round_button.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPage_State createState() => LoginPage_State();
}

class LoginPage_State extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late String email, password;
  FirebaseAuth? auth;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Login",
                        style: TextStyleHeading,
                      ),
                      Text(
                        "____",
                        style: TextStyleHeading,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextField(
                        obscuretext: false,
                        inputtype: TextInputType.emailAddress,
                        labeltext: "Email",
                        onChanged: (String getemail) {
                          email = getemail;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FormTextField(
                        obscuretext: true,
                        inputtype: TextInputType.text,
                        labeltext: "Password",
                        onChanged: (String getpass) {
                          password = getpass;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      FractionalTranslation(
                        translation: Offset(0, .4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RoundButton(
                              textval: "Login",
                              height: 40,
                              width: 120,
                              onpress: () async {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  loading = true;
                                });
                                try {
                                  final user = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  if (user != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    loading = false;
                                  });
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'No user found for that email.'));
                                    _scaffoldKey.currentState!
                                        .showSnackBar(snackBar);
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.'));
                                    _scaffoldKey.currentState!
                                        .showSnackBar(snackBar);
                                  }
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF252BA8), Color(0xFF2F2A6E)]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(400, 60),
                          bottomLeft: Radius.elliptical(400, 60))),
                ),

                //other half
                Container(
                  padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "or login with",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x93000000),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              splashColor: Colors.transparent,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(FontAwesomeIcons.facebook),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x93000000),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              splashColor: Colors.transparent,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(FontAwesomeIcons.google),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          new GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // RoundButton(
                      //   textval: "I'm a Instructor",
                      //   width: 150,
                      //   height: 50,
                      //   onpress: () {
                      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Ins_LoginPage()));
                      //   },
                      // )
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
}
