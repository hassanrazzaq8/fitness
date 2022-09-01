import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class inter_arm_exr extends StatefulWidget {
  @override
  _inter_arm_exrState createState() => _inter_arm_exrState();
}

class _inter_arm_exrState extends State<inter_arm_exr> {
  String kcal = '146.2';
  String exrtime = '26 mins';
  String exrtitle = 'ARM INTERMEDIATE';

  var interarm= [
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
      'title'  : 'FLOOR TRICEP DIPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'MILTARY PUSH UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'ALTERNATING HOOKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PUSH-UP & ROTATION',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG BARREL CURL LEFT',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG BARREL CURL RIGHT',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'FLOOR TRICEP DIPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'MILITARY PUSH UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },

    {
      'title'  : 'ALTERNATING HOOKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PUSH UPS & ROTATION',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG BARREL CURL LEFT',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG BARREL CURL RIGHT',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SKIPPING WITHOUT ROPE',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PUSH-UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'BURPES',
      'req' : 'x8',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'ARM SCISSORS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SKIPPING WITHOUT ROPE',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'BURPES',
      'req' : 'x8',
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
      'title'  : 'STANDING BICEPS STRETCH RIGHT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("ARM INTERMEDIATE"),backgroundColor: Colors.transparent,elevation: 0,),
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
                  for(int i=0;i<interarm.length;i++)
                      ExerCard(title: interarm[i]['title'],req:interarm[i]['reqtype']=='time'? "00:"+interarm[i]['req']!:interarm[i]['req'],gifpath: interarm[i]['anim'],),
                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(interarm,kcal,exrtime,exrtitle)));
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
