import 'package:fitnessapp/Instructor/instructor_screens/ins_homepage.dart';
import 'package:fitnessapp/Instructor/instructor_screens/ins_trainee.dart';
import 'package:fitnessapp/components/constants.dart';

import 'package:flutter/material.dart';

import 'instructor_screens/ins_profile.dart';

class InsNavDrawer extends StatefulWidget {
  @override
  _InsNavDrawerState createState() => _InsNavDrawerState();
}

class _InsNavDrawerState extends State<InsNavDrawer> {
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

class UserHeader extends StatelessWidget {
  const UserHeader({
    Key? key,
  }) : super(key: key);

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
              "Shahroz Javed",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "shahrozjaved39@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 15),
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
          title: Text("INSTRUCTOR"),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home Page"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => InsHomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Profile"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => InsProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("My Trainees"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => InsTraineePage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
