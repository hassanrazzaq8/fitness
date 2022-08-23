import 'package:fitnessapp/components/plan_cards.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_abs_exr.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_arm_exr.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_chest_exr.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_leg_exr.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_shoulder_and_back_exr.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class interplan extends StatefulWidget {
  @override
  _interplanState createState() => _interplanState();
}

class _interplanState extends State<interplan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Intermediate Plan"),
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
              image: AssetImage("images/inter_plan.jpg"),
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
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inter_abs_exr()),
                        );
                      },
                    ),
                    //CHEST
                    PlanCards(
                      imagepath: "images/chest_ex.jpg",
                      cardText: "Chest",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inter_chest_exr()),
                        );
                      },
                    ),
                    //ARMS
                    PlanCards(
                      imagepath: "images/arm_ex.jpg",
                      cardText: "ARM",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inter_arm_exr()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/leg_ex.jpg",
                      cardText: "LEG",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inter_leg_exr()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/shoulder_back_ex.jpg",
                      cardText: "SHOULDER & BACK",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  inter_shoulder_and_back_exr()),
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
