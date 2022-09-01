import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

import '../start_exer.dart';

class AdvAbsExr extends StatefulWidget {
  @override
  _AdvAbsExrState createState() => _AdvAbsExrState();
}

class _AdvAbsExrState extends State<AdvAbsExr> {

  String kcal = '146.2';
  String exrtime = '36 mins';
  String exrtitle = 'ABS ADVANCE';

  var advabs = [
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SIT UPS',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE BRIDGE LEFT',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE BRIDGE RIGHT',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'ABDOMINAL CRUNCHES',
      'req' : 'x30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'BICYCLE CRUNCHES',
      'req' : 'x24',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE PLANK RIGHT',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SIDE PLANK LEFT',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'V-UP',
      'req' : 'x18',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PUSH-UP & ROTATION',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'V-UP',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },

    {
      'title'  : 'HEEL TOUCH',
      'req' : 'x26',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'ABDOMINAL CRUNCHES',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PLANK',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'CROSSOVER CRUNCH',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'LEG RAISES',
      'req' : 'x16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'BICYCLE CRUNCHES',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PUSH-UP & ROTATION',
      'req' : 'x20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SIDE PLANK RIGHT',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SIDE PLANK LEFT',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'COBRA STRETCH',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SPINE LUMBER TWIST STRETCH LEFT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'SPINE LUMBER TWIST STRETCH RIGHT',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("ABS INTERMEDIATE"),
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
                  for(int i=0;i<advabs.length;i++)
                    ExerCard(title: advabs[i]['title'],req:advabs[i]['reqtype']=='time'? "00:"+advabs[i]['req']!:advabs[i]['req'],gifpath: advabs[i]['anim'],),
                  SizedBox(height: 10,),
                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(advabs,kcal,exrtime,exrtitle)));
                  },)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
