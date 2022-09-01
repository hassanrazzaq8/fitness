import 'package:fitnessapp/components/plan_cards.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_abs_exr.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_arm_exr.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_chest_exr.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_leg_exr.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_shoulder_and_back_exr.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class BeginnerPlan extends StatefulWidget {
  @override
  _BeginnerPlanState createState() => _BeginnerPlanState();
}

class _BeginnerPlanState extends State<BeginnerPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Beginner Plan"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/beginner_plan.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //ABS
                    PlanCards(
                      imagepath: "images/abs_ex.jpg",
                      cardText: "ABS",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BigAbsExr()),
                        );
                      },
                    ),
                    //CHEST
                    PlanCards(
                      imagepath: "images/chest_ex.jpg",
                      cardText: "Chest",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => big_chest_exr()),
                        );
                      },
                    ),
                    //ARMS
                    PlanCards(
                      imagepath: "images/arm_ex.jpg",
                      cardText: "ARM",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BigAarmExr()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/leg_ex.jpg",
                      cardText: "LEG",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => big_leg_exr()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/shoulder_back_ex.jpg",
                      cardText: "SHOULDER & BACK",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  big_shoulder_and_back_exr()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
