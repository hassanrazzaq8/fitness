import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrackingData extends StatefulWidget {
  @override
  _TrackingDataState createState() => _TrackingDataState();
}

class _TrackingDataState extends State<TrackingData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(title: Text('Tracking'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            child: Text('Your Workout Data',style: TextStyleHeadingBlack,),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("userexer")
                    .doc(FirebaseAuth.instance.currentUser.email)
                    .collection("workouts")
                    .orderBy('date', descending: true)
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
                    children: snapshot.data.docs.map((document) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(document["title"],style: TextStyleFormBlackBold,),
                              SizedBox(
                                height: 5,
                              ),
                              //STEPS
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    color: Colors.deepOrange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Exercise time: " + document['exrtime'],
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
                                    document['date'],
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
          ),
        ],
      ),
    );
  }
}
