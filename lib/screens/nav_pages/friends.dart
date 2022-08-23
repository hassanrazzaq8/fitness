import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friends")),
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
            )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  ProfileCard(),
                  ProfileCard(),
                  ProfileCard(),
                  ProfileCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      "Friend 1",
                      style: TextStyleFormBlackBold,
                    ),
                    Text(
                      "friend@mail.com",
                      style: TextStyleFormBlack,
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
}

