import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cron/cron.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/home_page.dart';
import 'package:fitnessapp/screens/nav_pages/water_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
//DEFAULT MAIN
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  await Hive.openBox<bool>('notify');
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WaterPage();
    }));
  }

  Future<void> _repeatNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Water Remainder',
        'Drink your water glass',
        RepeatInterval.hourly,
        platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);

    _repeatNotification();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/abs_ex.jpg"), context);
    precacheImage(AssetImage("images/chest_ex.jpg"), context);
    precacheImage(AssetImage("images/arm_ex.jpg"), context);
    precacheImage(AssetImage("images/leg_ex.jpg"), context);
    precacheImage(AssetImage("images/shoulder_back_ex.jpg"), context);
    precacheImage(AssetImage("images/beginner_plan.jpg"), context);
    precacheImage(AssetImage("images/inter_plan.jpg"), context);
    precacheImage(AssetImage("images/advance_plan.jpg"), context);
    precacheImage(AssetImage("images/minerva.jpg"), context);
    precacheImage(AssetImage("images/mytrainees.jpg"), context);
    precacheImage(AssetImage("images/profile_avatar.png"), context);
    precacheImage(AssetImage("images/profile_trainer.jpg"), context);
    // precacheImage(AssetImage("images/review_trainer.jpg"), context);
    precacheImage(AssetImage("images/trainer_head.jpg"), context);
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData.light().copyWith(
        primaryColor: mainaccent,
      ),
      home: HomePage(),
    );
  }
}
