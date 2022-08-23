import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/start_ind_exr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class BigAbsExr extends StatefulWidget {
  @override
  _BigAbsExrState createState() => _BigAbsExrState();
}

class _BigAbsExrState extends State<BigAbsExr> {
  String kcal = '146.2';
  String exrtime = '20 mins';
  String exrtitle = 'ABS BEGINNER';

  var begabs = [
    {
      'title': 'JUMPING JACKS',
      'req': '20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'time'
    },
    {
      'title': 'ABDOMINAL CRUNCHES',
      'req': 'x16',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'RUSSSIAN TWIST',
      'req': 'x20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'MOUNTAIN CLIMBER',
      'req': 'x16',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'HEEL TOUCH',
      'req': 'x20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'LEG RAISES',
      'req': 'x16',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'PLANK',
      'req': '20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'time'
    },
    {
      'title': 'ABDOMINAL CRUNCHES',
      'req': 'x12',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'RUSSSIAN TWIST',
      'req': 'x32',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'MOUNTAIN CLIMBER',
      'req': 'x12',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'HEEL TOUCH',
      'req': 'x20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'LEG RAISES',
      'req': 'x14',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'PLANK',
      'req': '20',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'time'
    },
    {
      'title': 'COBRA STRETCH',
      'req': '30',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'time'
    },
    {
      'title': 'SPINE LUMBER TWIST STRETCH LEFT',
      'req': 'x16',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SPINE LUMBER TWIST STRETCH RIGHT',
      'req': 'x16',
      'anim': 'images/jumping_jack2.gif',
      'reqtype': 'sets'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("ABS"),
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
              image: AssetImage("images/abs_ex.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for (int i = 0; i < begabs.length; i++)
                    ExerCard(
                      title: begabs[i]['title'],
                      req: begabs[i]['reqtype'] == 'time'
                          ? "00:" + begabs[i]['req']
                          : begabs[i]['req'],
                      gifpath: begabs[i]['anim'],
                      ontap: () {
                        //FOR INDIVIDUAL EXERCISE
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartIndexr(
                                      animpath: begabs[i]['anim'],
                                      exrtitle: begabs[i]['title'],
                                      exrreq: begabs[i]['req'],
                                      exrreqtype: begabs[i]['reqtype'],
                                    )));
                      },
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    textval: "START EXERCISE",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartExer(begabs, kcal, exrtime, exrtitle)));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
