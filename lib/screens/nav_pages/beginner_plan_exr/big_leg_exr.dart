import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class big_leg_exr extends StatefulWidget {
  @override
  _big_leg_exrState createState() => _big_leg_exrState();
}

class _big_leg_exrState extends State<big_leg_exr> {
  String kcal = '146.2';
  String exrtime = '26 mins';
  String exrtitle = 'LEG BEGINNER';

  var begleg = [
    {
      'title': 'SIDE HOP',
      'req': '30',
      'anim': 'images/gif/side hop.gif',
      'reqtype': 'time'
    },
    {
      'title': 'SQUATS',
      'req': 'x12',
      'anim': 'images/gif/squats.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SQUATS',
      'req': 'x12',
      'anim': 'images/gif/squats.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SIDE-LYING LEG LIFT LEFT',
      'req': 'x12',
      'anim': 'images/gif/side-lying leg lift left.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SIDE-LYING LEG LIFT RIGHT',
      'req': 'x12',
      'anim': 'images/gif/side-lying leg lift right.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SIDE-LYING LEG LIFT LEFT',
      'req': 'x12',
      'anim': 'images/gif/side-lying leg lift left.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SIDE-LYING LEG LIFT RIGHT',
      'req': 'x12',
      'anim': 'images/gif/side-lying leg lift right.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'BACKWARD LUNGE',
      'req': 'x14',
      'anim': 'images/gif/backward lunges.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'BACKWARD LUNGE',
      'req': 'x14',
      'anim': 'images/gif/backward lunges.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'LEFT QUAD STRETCH WITH WALL',
      'req': '30',
      'anim': 'images/gif/calf stretch left.gif',
      'reqtype': 'time'
    },
    {
      'title': 'RIGHT QUAD STRETCH WITH WALL',
      'req': '30',
      'anim': 'images/gif/calf stretch right.gif',
      'reqtype': 'time'
    },
    // {
    //   'title': 'KNEE TO CHEST STRETCH LEFT',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'KNEE TO CHEST STRETCH RIGHT',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    {
      'title': 'CALF RAISES',
      'req': 'x12',
      'anim': 'images/gif/calf raises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'CALF RAISES',
      'req': 'x12',
      'anim': 'images/gif/calf raises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SUMO SQUAT CALF RAISES',
      'req': 'x12',
      'anim': 'images/gif/sumo squat calf raises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SUMO SQUAT CALF RAISES',
      'req': 'x12',
      'anim': 'images/gif/sumo squat calf raises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'CALF STRETCH LEFT',
      'req': '30',
      'anim': 'images/gif/calf stretch left.gif',
      'reqtype': 'time'
    },
    {
      'title': 'CALF STRETCH RIGHT',
      'req': '30',
      'anim': 'images/gif/calf stretch right.gif',
      'reqtype': 'time'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("LEG"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // drawer: NavDrawer(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/leg_ex.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for (int i = 0; i < begleg.length; i++)
                    ExerCard(
                      title: begleg[i]['title'],
                      req: begleg[i]['reqtype'] == 'time'
                          ? "00:" + begleg[i]['req']
                          : begleg[i]['req'],
                      gifpath: begleg[i]['anim'],
                    ),
                  RoundButton(
                    textval: "START EXERCISE",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartExer(begleg, kcal, exrtime, exrtitle)));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
