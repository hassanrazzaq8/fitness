import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/instructor/instructor_screens/trainee_profile.dart';
import 'package:fitnessapp/components/rect_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/components/custom_loading.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class ReqTrainer extends StatefulWidget {
  @override
  _ReqTrainerState createState() => _ReqTrainerState();
}

class _ReqTrainerState extends State<ReqTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trainers Requests'),),
      drawer: NavDrawer(),
      body: Container(
          padding: EdgeInsets.all(10),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('instructor')
                .doc(FirebaseAuth.instance.currentUser.email.toString())
                .collection('Trainer')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return ProfileCard(email: document['id'],);
                  }).toList(),
                );
              }
              return CustomLoading();
            },
          )
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  String email;


  ProfileCard({this.email});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TraineeProfile()));
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
                    image: AssetImage(
                        "images/profile_avatar.png"),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.email,
                        style: TextStyleFormBlack,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RectButton(
                            textval: 'Accept',
                          ),
                          RectButton(
                            textval: 'Decline',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


