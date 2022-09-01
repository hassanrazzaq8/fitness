import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../nav_drawer.dart';

class RunningHistory extends StatefulWidget {
  @override
  _RunningHistoryState createState() => _RunningHistoryState();
}

class _RunningHistoryState extends State<RunningHistory> {
  late FirebaseAuth auth;

  String userid = "id";

  Future<void> getCurrentUser() async {
    auth = FirebaseAuth.instance;
    try {
      final user = await auth.currentUser;
      if (user != null) {
        setState(() {
          userid = user.email.toString().trim();
        });
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Running History"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("userexer")
              .doc(userid)
              .collection("running")
              .orderBy('time', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              //TODO adding a loading bar
              return Center(
                child: Text(
                  "Loading Data Please Wait",
                  style: TextStyleHeadingBlack,
                ),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //STEPS
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.walking,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Steps: " + document['steps'],
                              style: TextStyleFormBlack,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //DISTANCE
                        Row(
                          children: [
                            Icon(
                              Icons.trending_up,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Distance: " + document['distance'],
                              style: TextStyleFormBlack,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //KCAL
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.fire,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "KCAL: " + document['kcal'],
                              style: TextStyleFormBlack,
                            ),
                          ],
                        ),
                        Divider(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              document['time'],
                              style: TextStyleFormBlack,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
