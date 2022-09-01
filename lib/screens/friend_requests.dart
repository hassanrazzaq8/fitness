import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/rect_button.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FriendRequests extends StatefulWidget {
  const FriendRequests({Key? key}) : super(key: key);

  @override
  State<FriendRequests> createState() => _FriendRequestsState();
}

class _FriendRequestsState extends State<FriendRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Friend Requests",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.email.toString())
              .collection('Requests')
              .where('status', isEqualTo: "pending")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return UserProfileCard(
                    email: document['id'],
                  );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class UserProfileCard extends StatefulWidget {
  final String email;

  UserProfileCard({required this.email});

  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  String userMail = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.email,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RectButton(
                          textval: 'Accept',
                          height: 40,
                          onpress: () {
                            addtrainer(widget.email, context);
                          },
                        ),
                        RectButton(
                          textval: 'Decline',
                          height: 40,
                          onpress: () {
                            removetrainer(widget.email, context);
                          },
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
    );
  }

  Future<void> addtrainer(String? traineremail, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userMail)
        .collection('Requests')
        .doc(traineremail)
        .update({
          'status': 'approved',
        })
        .then((value) => print("Request accepted"))
        .catchError((error) => print("Failed to accept Request: $error"));

    await FirebaseFirestore.instance
        .collection('users')
        .doc(traineremail)
        .collection("MyFriends")
        .doc(userMail)
        .set({
      'id': userMail,
    }).then((value) {
      print("added ins in user");
      Toast.show("Request Accepted", gravity: Toast.bottom, duration: 4);
    }).catchError((error) => print("Failed to add ins in user: $error"));
  }

  Future<void> removetrainer(String? traineremail, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userMail)
        .collection('Requests')
        .doc(traineremail)
        .delete()
        .then((value) {
      print("removed request");
      Toast.show("Request Declined", gravity: Toast.bottom, duration: 4);
    }).catchError((error) => print("Failed to remove request: $error"));
  }
}
