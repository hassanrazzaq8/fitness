import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/all_users.dart';
import 'package:fitnessapp/screens/friend_requests.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/trainee_profile.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllUsers(),
                ),
              );
            },
            icon: Icon(
              Icons.person_add,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendRequests(),
                ),
              );
            },
            icon: Icon(Icons.notifications),
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
                "Your Friends",
                style: TextStyleHeading,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.email.toString())
                    .collection('MyFriends')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        return ProfileCard(
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
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String email;

  ProfileCard({required this.email});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TraineProfile(
              email: email,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 120,
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
                  child: Text(
                    email,
                    style: TextStyleFormBlack,
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
