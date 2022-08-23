import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class big_shoulder_and_back_exr extends StatefulWidget {
  @override
  _big_shoulder_and_back_exrState createState() => _big_shoulder_and_back_exrState();
}

class _big_shoulder_and_back_exrState extends State<big_shoulder_and_back_exr> {
  String kcal = '146.2';
  String exrtime = '17 mins';
  String exrtitle = 'SHOULDER & BACK BEGINNER';

  var beg_shoulder_back= [
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'ARM RAISES',
      'req' : '16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'RHOMBOID PULLS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE ARM RAISE',
      'req' : '16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'KNEE PUSH-UPS',
      'req' : '14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE-LYING FLOOR STRETCH LEFT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SIDE-LYING FLOOR STRETCH RIGHT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'ARM SCISSOR',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'RHOMBOID PULLS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },

    {
      'title'  : 'SIDE ARM RAISE',
      'req' : '14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'KNEE PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'CAT COW POSE',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'PRONE TRICEPS PUSH UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'RECLINED RHOMBOID SQUEEZES',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PRONE TRICEPS PUSH UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'RECLINED RHOMBOID SQUEEZES',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : "CHILD'S POSE",
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("SHOULDER & BACK"),backgroundColor: Colors.transparent,elevation: 0,),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/shoulder_back_ex.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for(int i=0;i<beg_shoulder_back.length;i++)
                    ExerCard(title: beg_shoulder_back[i]['title'],req:beg_shoulder_back[i]['reqtype']=='time'? "00:"+beg_shoulder_back[i]['req']:beg_shoulder_back[i]['req'],gifpath: beg_shoulder_back[i]['anim'],),

                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(beg_shoulder_back,kcal,exrtime,exrtitle)));
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
