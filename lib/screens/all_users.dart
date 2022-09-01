import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Trainees"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    return UserProfile(
                      email: document['email'],
                      name: document['name'],
                    );
                  },
                ).toList(),
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

class UserProfile extends StatefulWidget {
  final String email;
  final String name;

  UserProfile({
    required this.email,
    required this.name,
  });

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isreq = false;

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
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    isreq
                        ? RoundButton(
                            textval: 'Cancel Request',
                            height: 30,
                            onpress: () {
                              setState(() {
                                isreq = false;
                                print(isreq);
                                cancelRequest(mail: widget.email);
                              });
                            },
                          )
                        : RoundButton(
                            textval: 'Request',
                            height: 30,
                            onpress: () {
                              setState(() {
                                isreq = true;
                                print(isreq);
                                sendRequest(mail: widget.email);
                              });
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendRequest({String? mail}) async {
    final users = await FirebaseFirestore.instance
        .collection('users')
        .doc(mail)
        .collection("Requests")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .set({
          'id': FirebaseAuth.instance.currentUser!.email.toString(),
          'status': 'pending'
        })
        .then((value) => print("Request Sent to Instructor"))
        .catchError((error) => print("Failed to send Request: $error"));

    return users;
  }

  Future<void> cancelRequest({String? mail}) async {
    final users = await FirebaseFirestore.instance
        .collection('users')
        .doc(mail)
        .collection("Requests")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .delete()
        .then((value) => print("Request canceled"))
        .catchError((error) => print("Failed to perform delettion: $error"));

    return users;
  }
}
