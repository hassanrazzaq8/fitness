import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/start_exer.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class big_chest_exr extends StatefulWidget {
  @override
  _big_chest_exrState createState() => _big_chest_exrState();
}

class _big_chest_exrState extends State<big_chest_exr> {

  String kcal = '146.2';
  String exrtime = '9 mins';
  String exrtitle = 'CHEST BEGINNER';

  var begchest= [
    {
      'title'  : 'JUMPING JACKS',
      'req' : '30',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'INCLINE PUSH-UPS',
      'req' : 'x16',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'KNEE PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'PUSH-UPS',
      'req' : 'x10',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'WIDE ARM PUSH-UPS',
      'req' : 'x10',
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
      'title'  : 'BOX PUSH-UPS',
      'req' : 'x12',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'sets'
    },
    {
      'title'  : 'WIDE ARM PUSH-UPS',
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
      'title'  : 'COBRA STRETCH',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
    {
      'title'  : 'CHEST STRETCH',
      'req' : '20',
      'anim'  : 'images/jumping_jack2.gif',
      'reqtype':'time'
    },
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("CHEST"),backgroundColor: Colors.transparent,elevation: 0,),
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

                  for(int i=0;i<begchest.length;i++)
                    ExerCard(title: begchest[i]['title'],req:begchest[i]['reqtype']=='time'? "00:"+begchest[i]['req']:begchest[i]['req'],gifpath: begchest[i]['anim'],),

                  RoundButton(textval: "START EXERCISE",onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartExer(begchest,kcal,exrtime,exrtitle)));
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
