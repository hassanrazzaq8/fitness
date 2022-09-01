import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterPage extends StatefulWidget {
  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  int stepsgoal = 10;
  double? perc = 0.0;
  int? todaySteps;
  int? glasses = 0;
  bool done = false;

  bool daypass = false;
  String _dayPassGlass = "";
  int? _dayPassTime;

  late SharedPreferences _preferences;

  void waterTakeHandler() async {
    _preferences = await SharedPreferences.getInstance();
    _dayPassTime = _preferences.getInt("day");
    setState(() {
      if (DateTime.now().day.toInt() == _dayPassTime) {
        setState(() {});
        _dayPassGlass = _preferences.get("glasses").toString();
        _preferences.setString("dayPassGlass", _dayPassGlass);
        glasses = 0;
        perc = 0;
      } else {
        if (_preferences.get("glasses") != null)
          glasses = _preferences.get("glasses") as int?;
        if (_preferences.get("percentage") != null)
          perc = _preferences.get("percentage") as double?;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waterTakeHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Water Intake")),
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(" Glass", style: TextStyleForm),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (done == false) {
                          perc! > 0.99 ? done = true : glasses = glasses! + 1;
                          print(glasses.toString());
                          _preferences.setInt("glasses", glasses!);
                          perc! > 0.99 ? done = true : perc = perc! + 0.1;
                          print(perc.toString());
                          _preferences.setDouble("percentage", perc!);
                          _preferences.setInt(
                              "day", DateTime.now().day.toInt() + 1);
                        } else {
                          print("dont done ");
                        }
                      });
                    },
                    child: CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: 15.0,
                      percent: perc!,
                      progressColor: Colors.blue[500],
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: mainaccent,
                            backgroundImage:
                                AssetImage("images/water_avatar.png"),
                          ),
                          Text(
                            glasses.toString(),
                            style: TextStyleForm,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  done
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Today Goal completed",
                              style: TextStyleForm,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : Container()
                ],
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your yesterday water glasses are:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _preferences.getString("dayPassGlass") == null
                      ? "0"
                      : _preferences.getString("dayPassGlass").toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
