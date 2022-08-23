import 'package:fitnessapp/Instructor/instructor_screens/ins_trainee.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/instructor/ins_nav_drawer.dart';
import 'package:fitnessapp/instructor/instructor_screens/ins_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsHomePage extends StatefulWidget {
  @override
  _InsHomePageState createState() => _InsHomePageState();
}

class _InsHomePageState extends State<InsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instructor Home")),
      drawer: InsNavDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/trainer_head.jpg"),
              fit: BoxFit.cover,
            )),
            child: Text(
              "Welcome, Trainer",
              style: TextStyleHeadingBold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: trainertabs(
                              label: "Profile",
                              imgpath: "images/profile_trainer.jpg",
                              onpress: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InsProfilePage()));
                              }),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: trainertabs(
                              label: "Trainees",
                              imgpath: "images/mytrainees.jpg",
                              onpress: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InsTraineePage()));
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: trainertabs(
                            label: "Reviews",
                            imgpath: "images/review_trainer.jpg",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector trainertabs(
      {String imgpath, String label, Function onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage(imgpath),
              fit: BoxFit.cover,
            )),
        child: Text(
          label,
          style: TextStyleHeadingBold,
        ),
      ),
    );
  }
}
