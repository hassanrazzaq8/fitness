import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class inter_chest_exr extends StatefulWidget {
  @override
  _inter_chest_exrState createState() => _inter_chest_exrState();
}

class _inter_chest_exrState extends State<inter_chest_exr> {
  String kcal = '146.2';
  String exrtime = '15 mins';
  String exrtitle = 'CHEST INTERMEDIATE';

  var interchest= [
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
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
      'title'  : 'PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'WIDE ARM PUSH-UPS',
      'req' : 'x16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'HINDU PUSH-UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'STAGGERED PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PUSH-UP & ROTATION',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },

    {
      'title'  : 'KNEE PUSH-UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'HINDU PUSH-UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'DECLINE PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'STAGGERED PUSH-UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'SHOULDER PUSH-UPS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'COBRA PUSH-UPS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'CHEST PUSH-UPS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("CHEST INTERMEDIATE"),backgroundColor: Colors.transparent,elevation: 0,),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/chest_ex.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for(int i=0;i<interchest.length;i++)
                    ExerCard(title: interchest[i]['title'],req:interchest[i]['reqtype']=='time'? "00:"+interchest[i]['req']!:interchest[i]['req'],gifpath: interchest[i]['anim'],),
                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(interchest,kcal,exrtime,exrtitle)));
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
