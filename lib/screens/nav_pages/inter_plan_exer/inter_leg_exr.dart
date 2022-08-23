import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class inter_leg_exr extends StatefulWidget {
  @override
  _inter_leg_exrState createState() => _inter_leg_exrState();
}

class _inter_leg_exrState extends State<inter_leg_exr> {
  @override
  Widget build(BuildContext context) {

    String kcal = '146.2';
    String exrtime = '41 mins';
    String exrtitle = 'LEG INTERMEDIATE';

    var interleg= [
      {
        'title'  : 'JUMPING JACKS',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'SQUATS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SQUATS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SQUATS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'FIRE HYDRANT LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'FIRE HYDRANT RIGHT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'LUNGES',
        'req' : 'x14',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'LUNGES',
        'req' : 'x14',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SIDE LEG CIRCLES LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SIDE LEG CIRCLES RIGHT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SIDE LEG CIRCLES LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SIDE LEG CIRCLES RIGHT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SIDE LEG CIRCLES LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SUMO SQUAT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SUMO SQUAT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SUMO SQUAT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'REVERSE FLUTTER KICKS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'REVERSE FLUTTER KICKS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'REVERSE FLUTTER KICKS',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'WALL SIT',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'LEFT QUAD STRETCH WITH WALL',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'RIGHT QUAD STRETCH WITH WALL',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'KNEE TO STRETCH LEFT',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'KNEE TO STRETCH RIGHT',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'CALF RAISE WITH SPLAYED FOOT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'CALF RAISE WITH SPLAYED FOOT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'CALF RAISE WITH SPLAYED FOOT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SINGLE LEG CALF HOP LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SINGLE LEG CALF HOP RIGHT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SINGLE LEG CALF HOP LEFT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'SINGLE LEG CALF HOP RIGHT',
        'req' : 'x12',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'sets'
      },
      {
        'title'  : 'CALF STRETCH LEFT',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },
      {
        'title'  : 'CALF STRETCH RIGHT',
        'req' : '30',
        'anim'  : 'images/jumping_jack2.gif',
        'reqtype':'time'
      },




    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("LEG"),backgroundColor: Colors.transparent,elevation: 0,),
      drawer: NavDrawer(),
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
                  for(int i=0;i<interleg.length;i++)
                    ExerCard(title: interleg[i]['title'],req:interleg[i]['reqtype']=='time'? "00:"+interleg[i]['req']:interleg[i]['req'],gifpath: interleg[i]['anim'],),
                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(interleg,kcal,exrtime,exrtitle)));
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
