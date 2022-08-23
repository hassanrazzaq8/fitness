import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/dark_text_field.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:fitnessapp/components/form_text_field_dark.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/nav_pages/request_instructor.dart';
import 'package:fitnessapp/screens/nav_pages/video_calling_page.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'ins_profile_detail.dart';

class InstructorPage extends StatefulWidget {
  @override
  _InstructorPageState createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  bool haveins = false;

  Future<dynamic> checkIns() async {
    final DocumentReference document = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.email.toString())
        .collection('myinstructor')
        .doc();
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        if (snapshot.data() == null ||
            (snapshot.data() is String &&
                (snapshot.data() as String).isEmpty) ||
            (snapshot.data() is List && (snapshot.data() as List).isEmpty)) {
          setState(() {
            haveins = true;
            print(haveins);
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instructor"),
        actions: [
          haveins
              ? null
              : Container(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.2),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReqInstructor()));
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
        ],
      ),
      drawer: NavDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: mainaccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(400, 60),
                    bottomLeft: Radius.elliptical(400, 60))),
            child: Center(
                child: Text(
              "My Instructor",
              style: TextStyleHeading,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InsTrainerProfileCards(
              title: "Join Live Video Call",
              icondata: Icons.video_call,
              onpress: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoCallPage()));
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser.email.toString())
                        .collection('myinstructor')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView(
                            children: snapshot.data.docs.map((document) {
                              return inscard(
                                email: document['id'],
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class inscard extends StatelessWidget {
  String name, email;

  inscard({this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InsProfileDetailPage(
                      email: email,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/profile_avatar.png"),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          email,
                          style: TextStyleFormBlack,
                        ),
                        ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Material(
                              color: Colors.blue,
                              child: MaterialButton(
                                splashColor: Colors.amber,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                                recvremail: email,
                                              )));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.chat,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InsTrainerProfileCards extends StatelessWidget {
  String title;
  IconData icondata;
  Function onpress;

  InsTrainerProfileCards({this.title, this.icondata, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 80,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.indigo,
        elevation: 5.0,
        child: MaterialButton(
          elevation: 5.0,
          onPressed: onpress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Icon(
                icondata,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
