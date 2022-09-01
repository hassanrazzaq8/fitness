import 'package:fitnessapp/components/plan_cards.dart';
import 'package:fitnessapp/screens/nav_pages/adv_plan_exer/adv_abs_exr.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/nav_pages/inter_plan_exer/inter_abs_exr.dart';
import 'package:flutter/material.dart';

import '../inter_plan_exer/inter_arm_exr.dart';
import '../inter_plan_exer/inter_chest_exr.dart';
import '../inter_plan_exer/inter_leg_exr.dart';
import '../inter_plan_exer/inter_shoulder_and_back_exr.dart';

class AdvPlan extends StatefulWidget {
  @override
  _AdvPlanState createState() => _AdvPlanState();
}

class _AdvPlanState extends State<AdvPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Advance Plan"),
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
              image: AssetImage("images/advance_plan.jpg"),
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
                      color3: Colors.red,
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
