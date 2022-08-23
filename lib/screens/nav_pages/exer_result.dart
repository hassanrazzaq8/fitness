import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExesiceReresult extends StatefulWidget {
  String getexerkcal;
  String getexercount;


  ExesiceReresult(this.getexerkcal,this.getexercount);



  @override
  _ExesiceReresultState createState() => _ExesiceReresultState(getexerkcal,getexercount);
}

class _ExesiceReresultState extends State<ExesiceReresult> {
  String exerkcal;
  String exercount;


  _ExesiceReresultState(this.exerkcal,this.exercount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: AppBar(title: Text('Result')),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset("images/donevector.jpg"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nice You have done it!',
                    style: TextStyleHeadingBlackBold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            exerkcal,
                            style: TextStyleHeadingBlackBold,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.fire,
                                color: Colors.orange,
                              ),
                              Text(
                                "Kcal",
                                style: TextStyleHeadingBlack,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            exercount,
                            style: TextStyleHeadingBlackBold,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.running,
                                color: Colors.red,
                              ),
                              Text(
                                "Exercises",
                                style: TextStyleHeadingBlack,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
