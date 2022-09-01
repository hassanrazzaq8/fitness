import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:flutter/material.dart';

import '../../nav_drawer.dart';

class BigAarmExr extends StatefulWidget {
  @override
  _BigAarmExrState createState() => _BigAarmExrState();
}

class _BigAarmExrState extends State<BigAarmExr> {

  String kcal = '146.2';
  String exrtime = '17 mins';
  String exrtitle = 'ARMS BEGINNER';

  var begarm= [
    {
      'title'  : 'ARM RAISES',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SIDE ARM RAISES',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'TRICEPS DIPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'ARM CIRCLES CLOCKWISE',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'ARM CIRCLES COUNTERCLOCKWISE',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'DIAMOND PUSH UPS',
      'req' : 'x6',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'CHEST PRESS PULSE',
      'req' : '16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },

    {
      'title'  : 'LEG BARREL CURL LEFT',
      'req' : 'x8',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG BARREL CURL LEFT',
      'req' : 'x8',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'DIAGONAL PLANK',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PUNCHES',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PUSH UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'INCHWORMS',
      'req' : 'x8',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'WALL PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'TRICEP STRETCH LEFT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'TRICEP STRETCH RIGHT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'STANDING BICEPS STRETCH LEFT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },

    {
      'title'  : 'STANDING BICEPS STRETCH LEFT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("ARM"),backgroundColor: Colors.transparent,elevation: 0,),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/arm_ex.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for(int i=0;i<begarm.length;i++)
                    ExerCard(title: begarm[i]['title'],req:begarm[i]['reqtype']=='time'? "00:"+begarm[i]['req']!:begarm[i]['req'],gifpath: begarm[i]['anim'],),

              RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(begarm,kcal,exrtime,exrtitle)));
                  },)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
