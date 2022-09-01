import 'package:fitnessapp/components/round_button_white.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/exer_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class StartIndexr extends StatefulWidget {
  String? animpath;
  String? exrtitle;
  String? exrreqtype;
  String? exrreq;

  StartIndexr({this.animpath, this.exrtitle, this.exrreqtype, this.exrreq});

  @override
  _StartIndexrState createState() =>
      _StartIndexrState(animpath, exrtitle, exrreqtype, exrreq);
}

class _StartIndexrState extends State<StartIndexr> {
  String? animpath;
  String? exrtitle;
  String? exrreqtype;
  String? exrreq;

  _StartIndexrState(this.animpath, this.exrtitle, this.exrreqtype, this.exrreq);
  int endTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INDIVIDUAL EXRECISE"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Center(
                  child: Image.asset(animpath!),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: mainaccent,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        exrtitle!,
                        style: TextStyleHeading,
                        textAlign: TextAlign.center,
                      ),
                      if (exrreqtype == 'time') // to check time  or sets
                        // CountdownTimer(
                        //   onEnd: () {
                        //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExesiceReresult('10','1')));
                        //   },
                        //   endTime: endTime = DateTime.now()
                        //           .millisecondsSinceEpoch +
                        //       1000 * int.parse(exrreq),
                        //   textStyle: TextStyleHeading,
                        // ),
                        if (exrreqtype == 'sets') // to check time  or sets
                          Text(
                            exrreq!,
                            style: TextStyleHeading,
                            textAlign: TextAlign.center,
                          ),
                      Container(
                          child: RoundButtonWhite(
                        textval: "DONE",
                        width: 100,
                        onpress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExesiceReresult('10', '1')));
                        },
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
