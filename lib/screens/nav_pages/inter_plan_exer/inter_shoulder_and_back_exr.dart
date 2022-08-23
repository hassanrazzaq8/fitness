import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class inter_shoulder_and_back_exr extends StatefulWidget {
  @override
  _inter_shoulder_and_back_exrState createState() => _inter_shoulder_and_back_exrState();
}

class _inter_shoulder_and_back_exrState extends State<inter_shoulder_and_back_exr> {

  String kcal = '146.2';
  String exrtime = '29 mins';
  String exrtitle = 'SHOULDER & BACK INTERMEDIATE';

  var inter_shoulder_back= [
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'TRICEP KICKBACKS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'INCLINE PUSH-UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'RHOMBOID PULLS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'CAT COW POSE',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'TRICEP KICKBACKS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'INCLINE PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'HIP HINGE',
      'req' : '10',
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
      'title'  : 'HOVER PUSH UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SWIMMER AND SUPERMAN',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'HOVER PUSH UPS',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SWIMMER AND SUPERMAN',
      'req' : 'x14',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'HOVER PUSH UPS',
      'req' : 'x14',
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
                  for(int i=0;i<inter_shoulder_back.length;i++)
                    ExerCard(title: inter_shoulder_back[i]['title'],req:inter_shoulder_back[i]['reqtype']=='time'? "00:"+inter_shoulder_back[i]['req']:inter_shoulder_back[i]['req'],gifpath: inter_shoulder_back[i]['anim'],),

                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(inter_shoulder_back,kcal,exrtime,exrtitle)));
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
