import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_picker/day_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/plan_cards.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:fitnessapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'beginner_plan_exr/beginner_plan.dart';
import 'diet_page.dart';
import 'inter_plan_exer/inter_plan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;
  List<String>? isgoalset;
  String? userid;
  late List daylist;
  late FlutterLocalNotificationsPlugin fltrnotifcation;
  Box<bool> dailynotifyBox = Hive.box('notify');
  int dailynotifykey = 100;

  Future<void> getCurrentUser() async {
    auth = FirebaseAuth.instance;
    try {
      final user = auth.currentUser;
      if (user != null) {
        setState(() {
          userid = user.email.toString().trim();
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future _showNotificatiion() async {
    var androidDetails = new AndroidNotificationDetails(
        "ChannelId", "Minerva Fitness",
        importance: Importance.max);
    var iOsDetails = new IOSNotificationDetails();
    var genernotifdetails =
        new NotificationDetails(android: androidDetails, iOS: iOsDetails);

    //periodically schedule
    fltrnotifcation.periodicallyShow(
        100,
        "Hi! Let's get back to be Fit",
        "Complete your Goals or do some new exercises and activities to get more out of the Minerva Fitness",
        RepeatInterval.daily,
        genernotifdetails);

    dailynotifyBox.put(dailynotifykey, true);
  }

  Future notificationSelected(String? payload) async {}

  @override
  void initState() {
    var androidinitialize = new AndroidInitializationSettings('app_icon');
    var iOSinitialization = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(
        android: androidinitialize, iOS: iOSinitialization);
    fltrnotifcation = new FlutterLocalNotificationsPlugin();
    fltrnotifcation.initialize(initSettings,
        onSelectNotification: notificationSelected);
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 20),
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
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyleForm,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "WORKOUT",
                                  style: TextStyleForm,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyleForm,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "KCAL",
                                  style: TextStyleForm,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyleForm,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "MINUTE",
                                  style: TextStyleForm,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      FractionalTranslation(
                          translation: Offset(0, .2),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: EdgeInsets.all(20),
                            child: showuserWeekdays(),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    PlanCards(
                      imagepath: "images/beginner_plan.jpg",
                      cardText: "Beginner",
                      color1: Colors.red,
                      color2: Colors.white,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BeginnerPlan()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/inter_plan.jpg",
                      cardText: "Intermediate",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.white,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => interplan()),
                        );
                      },
                    ),
                    PlanCards(
                      imagepath: "images/advance_plan.jpg",
                      cardText: "Advanced",
                      color1: Colors.red,
                      color2: Colors.red,
                      color3: Colors.red,
                      ontap: () {},
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //DIET
                          Column(
                            children: [
                              Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: mainaccent, // button color
                                child: InkWell(
                                  splashColor: Colors.white.withOpacity(0.2),
                                  // inkwell color
                                  child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Icon(
                                        FontAwesomeIcons.listAlt,
                                        color: Colors.white,
                                      )),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DietPage()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'DIET',
                                style: TextStyleFormBlackBold,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        // ignore: deprecated_member_use
        List<String> days = [];
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox.expand(
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please select Exercise days in a week",
                        style: TextStyleFormBlackBold,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SelectWeekDays(
                        border: false,
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [Color(0xFF252BA8), Color(0xFF2F2A6E)],
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),
                        onSelect: (values) {
                          // <== Callback to handle the selected days

                          print(values);
                          days = values;
                        },
                        days: [],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RoundButton(
                        height: 40,
                        textval: "Done",
                        onpress: () {
                          addUserGoal(days);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.only(bottom: 40, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  addUserGoal(List<String> days) async {
    if (days.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final dynamic users = await FirebaseFirestore.instance
          .collection('userexer')
          .doc(userid)
          .update({
        'goal': days.toList(),
        'isgoal': "set",
      }).then((value) {
        setState(() {
          print("Goal Added");
          Toast.show("Goal Added", gravity: Toast.bottom, duration: 2);
          _showNotificatiion();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      }).catchError((error) => print("Failed to add user: $error"));

      return users;
    }
  }

  static List<String> getDaysOfWeek([String? locale]) {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => index)
        .map((value) => DateFormat(DateFormat.DAY, locale)
            .format(firstDayOfWeek.add(Duration(days: value))))
        .toList();
  }

  FutureBuilder<DocumentSnapshot> showuserWeekdays() {
    userid = auth.currentUser!.email;
    DocumentReference document =
        FirebaseFirestore.instance.collection("userexer").doc(userid);
    return FutureBuilder<DocumentSnapshot>(
      future: document.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          if (data['isgoal'] == "set") {
            daylist = List.from(data['goal']);
            return Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Week Goal',
                          style: TextStyle(color: mainaccent, fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showDialog();
                            });
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(color: mainaccent, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < getDaysOfWeek().length; i++)
                          if (i == 0)
                            weekday(
                                daylist.contains("Monday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 1)
                            weekday(
                                daylist.contains("Tuesday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 2)
                            weekday(
                                daylist.contains("Wednesday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 3)
                            weekday(
                                daylist.contains("Thursday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 4)
                            weekday(
                                daylist.contains("Friday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 5)
                            weekday(
                                daylist.contains("Saturday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                          else if (i == 6)
                            weekday(
                                daylist.contains("Sunday")
                                    ? Colors.indigoAccent
                                    : mainaccent,
                                getDaysOfWeek()[i])
                      ],
                    ),
                  ],
                ));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Wek Goal",
                  style: TextStyle(color: mainaccent, fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  "Set Your Weekly Goal",
                  style: TextStyle(color: mainaccent, fontSize: 20),
                ),
                SizedBox(height: 5),
                RoundButton(
                  textval: "Set a Goal",
                  height: 40,
                  onpress: () {
                    setState(() {
                      showDialog();
                    });
                  },
                )
              ],
            );
          }
        }
        return Container();
      },
    );
  }

  ClipOval weekday(Color getcolor, String daynum) {
    return ClipOval(
      child: Material(
        color: getcolor, // button color
        child: InkWell(
          splashColor: mainaccent, // inkwell color
          child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  daynum,
                  style: TextStyleForm,
                ),
              )),
          onTap: () {},
        ),
      ),
    );
  }
}
