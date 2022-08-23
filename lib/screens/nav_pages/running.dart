import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cron/cron.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/nav_pages/running_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:permission_handler/permission_handler.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class RunningPage extends StatefulWidget {
  @override
  _RunningPageState createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  Box<int> stepsBox = Hive.box('steps');
  double perc = 0.0;
  double getkm = 0.0;
  double getkcal = 0.0;
  int stepsgoal = 8000;
  int todaySteps;
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  FirebaseAuth auth;

  String userid = "id";

  Future<void> getCurrentUser() async {
    auth = FirebaseAuth.instance;
    try {
      final user = await auth.currentUser;
      if (user != null) {
        setState(() {
          userid = user.email.toString().trim();
        });
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getCurrentUser();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
      getTodaySteps(_steps);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);

      if (!mounted) return;
    }
  }

  Future<void> addUser_RunningData(
      {String steps, String kcal, String distance, String time}) async {
    final users = await FirebaseFirestore.instance
        .collection('userexer')
        .doc(userid)
        .collection("running")
        .doc()
        .set({
          'steps': steps,
          'kcal': kcal,
          'distance': distance,
          'time': time,
        })
        .then((value) => print("last day runnning data added to database"))
        .catchError((error) => print("Failed to add user: $error"));

    return users;
  }

  //Get Today Steps
  Future<int> getTodaySteps(String getsteps) async {
    int value = int.parse(getsteps);
    // This is where we'll write our logic
    print("******" + value.toString());
    int savedStepsCountKey = 999999;
    int savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);
    print("savedsteps:  " + savedStepsCount.toString());

    if (value < savedStepsCount) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    print(todayDayNo);
    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);
    print("lastdasaved: " + lastDaySaved.toString());
    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.

    if (lastDaySaved == 0) {
      lastDaySaved = todayDayNo;
      stepsBox..put(lastDaySavedKey, lastDaySaved);
      lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);
    }

    if (lastDaySaved < todayDayNo) {
      setState(() {
        int getfinalsteps = value - savedStepsCount;

        //percentage for circularpercentindcator
        perc = getfinalsteps / stepsgoal;

        //StepstoKM
        getkm = getfinalsteps / 1312.33595801;

        //StepstoKcal
        getkcal = getfinalsteps * 0.04;

        //get current date and time
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(now);

        addUser_RunningData(
            steps: getfinalsteps.toString(),
            kcal: double.parse((getkcal).toStringAsFixed(2)).toString(),
            distance: double.parse((getkm).toStringAsFixed(2)).toString(),
            time: formattedDate);
      });

      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount;

      //percentage for circularpercentindcator
      perc = todaySteps / stepsgoal;

      //StepstoKM
      getkm = todaySteps / 1312.33595801;

      //StepstoKcal
      getkcal = todaySteps * 0.04;
    });

    //for resetting hive values
//    stepsBox
//      ..put(lastDaySavedKey, 0)
//      ..put(savedStepsCountKey, 0);
//    stepsBox.put(328, todaySteps);

    print("todaysteps:  " + todaySteps.toString());
    return todaySteps; // this is your daily steps value.
  }

//  void resetdata()
//  {
//    setState(() {
//          stepsBox
//      ..put(888888, 0)
//      ..put(999999, 0);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    print(perc);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text("running"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: mainaccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(400, 60),
                        bottomLeft: Radius.elliptical(400, 60))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Goal: ",
                              style: TextStyleForm,
                            ),
                            Text(stepsgoal.toString(), style: TextStyleForm),
                            Text(" Steps", style: TextStyleForm),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              textval: "Change",
                              height: 30,
                              width: 100,
                              onpress: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircularPercentIndicator(
                        radius: 200.0,
                        lineWidth: 15.0,
                        percent: 0.0,
                        progressColor: Colors.blue[500],
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: mainaccent,
                              backgroundImage:
                                  AssetImage("images/runner_avatar.png"),
                            ),
                            Text(
                              todaySteps.toString(),
                              style: TextStyleForm,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                    double.parse((getkcal).toStringAsFixed(2))
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: mainaccent,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("KCAL",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: mainaccent,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                    double.parse((getkm).toStringAsFixed(2))
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: mainaccent,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("KM",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: mainaccent,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RunningHistory()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/graph_avatar.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("See Details",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: mainaccent,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
