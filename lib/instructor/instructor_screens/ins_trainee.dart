
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/instructor/ins_nav_drawer.dart';
import 'package:fitnessapp/instructor/instructor_screens/trainee_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsTraineePage extends StatefulWidget {
  @override
  _InsTraineePageState createState() => _InsTraineePageState();
}

class _InsTraineePageState extends State<InsTraineePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trainees"),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.2),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TraineeProfile()));
                },
                child: Icon(FontAwesomeIcons.userPlus),
              ),
            ),
          )
        ],
      ),
      drawer: InsNavDrawer(),
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
              "Your Trainees",
              style: TextStyleHeading,
            )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trainee 1",
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
      ),
    );
  }
}
