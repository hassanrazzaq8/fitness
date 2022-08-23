import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/friends.dart';
import 'package:fitnessapp/screens/nav_pages/instructor_page.dart';
import 'package:fitnessapp/screens/nav_pages/tracking_page.dart';
import 'package:fitnessapp/screens/nav_pages/home_page.dart';
import 'package:fitnessapp/screens/nav_pages/profile.dart';
import 'package:fitnessapp/screens/nav_pages/running.dart';
import 'package:fitnessapp/screens/nav_pages/settings_page.dart';
import 'package:fitnessapp/screens/nav_pages/water_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitnessapp/screens/nav_pages/google_fit.dart';

import 'nav_pages/diet_page.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(flex: 1, child: UserHeader()),
          Expanded(
            flex: 2,
            child: draweritems(),
          )
        ],
      ),
    );
  }
}

class UserHeader extends StatefulWidget {

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  FirebaseAuth auth;

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
    return Container(
      color: mainaccent,
      width: MediaQuery.of(context).size.width * 0.85,
      child: DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/minerva_tp.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              userid,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class draweritems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home Page"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.listAlt),
          title: Text("Diet"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DietPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Profile"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.handHoldingWater),
          title: Text("Water Intake"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => WaterPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_very_satisfied),
          title: Text("Health Tracking"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => TrackingPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.directions_run),
          title: Text("Running"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => RunningPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Friends"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => FriendsPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Instructor"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => InstructorPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Settings"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => SettingsPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Google Fit"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => GoogleFitpage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
