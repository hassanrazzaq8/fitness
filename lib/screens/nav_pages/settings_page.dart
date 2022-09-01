import 'dart:io';
import 'package:fitnessapp/components/rect_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/home_page.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:hive/hive.dart';
import 'package:platform/platform.dart';
import 'package:toast/toast.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late FlutterLocalNotificationsPlugin fltrnotifcation;
  bool? isSwitch;
  Box<bool> dailynotifyBox = Hive.box('notify');
  int dailynotifykey = 100;

  @override
  void initState() {
    isSwitch = dailynotifyBox.get(dailynotifykey, defaultValue: false);

    var androidinitialize = new AndroidInitializationSettings('app_icon');
    var iOSinitialization = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(
        android: androidinitialize, iOS: iOSinitialization);
    fltrnotifcation = new FlutterLocalNotificationsPlugin();
    fltrnotifcation.initialize(initSettings,
        onSelectNotification: notificationSelected);

    super.initState();
  }

  Future notificationSelected(String? payload) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => HomePage()),
    );
  }

  Future _showNotificatiion() async {
    var androidDetails = new AndroidNotificationDetails(
        "ChannelId", "Minerva Fitness",
        importance: Importance.max);
    var iOsDetails = new IOSNotificationDetails();
    var genernotifdetails =
        new NotificationDetails(android: androidDetails, iOS: iOsDetails);

    // await fltrnotifcation.show(1, "Minerva Fitness", "This is a test notification", genernotifdetails);

    //scheduledaily
    // var time = new Time(2,35,0);//at 3.30
    // await fltrnotifcation.showDailyAtTime(
    //     0,
    //     'Teer Result Time',
    //     'Open The App and check for the Result',
    //     time,
    //     genernotifdetails);

    //periodically schedule
    fltrnotifcation.periodicallyShow(
        100,
        "Hi! Let's get back to be Fit",
        "Complete your Goals or do some new exercises and activities to get more out of the Minerva Fitness",
        RepeatInterval.daily,
        genernotifdetails);

    //schedule a notification
    // var schedulaTime = DateTime.now().add(Duration(minutes: 1));
    // fltrnotifcation.schedule(1, "Minerva Fitness", "This is a Scheduled Notification", schedulaTime, genernotifdetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Notification testing'),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily Reminder",
                    style: TextStyleMediumBlack,
                  ),
                  Switch(
                      value: isSwitch!,
                      onChanged: (bool val) {
                        setState(() {
                          isSwitch = val;
                          if (isSwitch!) {
                            _showNotificatiion();
                          } else {
                            FlutterLocalNotificationsPlatform.instance
                                .cancel(100);
                            dailynotifyBox.put(dailynotifykey, false);
                            Toast.show('Updated Daily Reminder',
                                gravity: Toast.bottom, duration: 2);
                          }
                        });
                      })
                ],
              )
            ],
          )),
    );
  }
}
