import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:health/health.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';

import 'gfit_calories.dart';
import 'gfit_steps.dart';

class GoogleFitpage extends StatefulWidget {
  @override
  _GoogleFitpageState createState() => _GoogleFitpageState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class _GoogleFitpageState extends State<GoogleFitpage> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  int getsteps = 0;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    DateTime startDate = DateTime.now().subtract(Duration(days: 5));
    DateTime endDate = DateTime.now();

    HealthFactory health = HealthFactory();

    /// Define the types to get.
    List<HealthDataType> types = [
      HealthDataType.STEPS,
    ];

    setState(() => _state = AppState.FETCHING_DATA);

    /// You MUST request access to the data types before reading them
    bool accessWasGranted = await health.requestAuthorization(types);

    int steps = 0;

    if (accessWasGranted) {
      try {
        /// Fetch new data
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(startDate, endDate, types);

        /// Save all the new data points
        _healthDataList.addAll(healthData);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      /// Filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      /// Print the results
      _healthDataList.forEach((x) {
        print("Data point: $x");
        steps += (x.value as int);
        setState(() {
          getsteps = steps;
        });
      });

      print("Steps: $steps");

      /// Update the UI to display the results
      setState(() {
        _state =
            _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Text('Press the download button to fetch data');
  }

  Widget _authorizationNotGranted() {
    return Text('''Authorization not given.
        For Android please check your OAUTH2 client ID is correct in Google Developer Console.
         For iOS check your permissions in Apple Health.''');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();

    return _contentNotFetched();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text('Google Fit'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.download),
                onPressed: () {
                  fetchData();
                },
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              //Header
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    image: DecorationImage(
                        image: AssetImage("images/gfit_header.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.black.withOpacity(0.6),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getsteps.toString(),
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "STEPS",
                                style: TextStyleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.black.withOpacity(0.6)),
                        child: Text(
                          'Data from today to last 5 days',
                          style: TextStyleForm,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //BODY
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    children: [
                      gfitcards(
                        title: 'Steps',
                        icondata: FontAwesomeIcons.running,
                        iconcolor: Colors.indigo,
                        ontap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GfitSteps()));
                        },
                      ),
                      gfitcards(
                        title: 'Sleep',
                        icondata: FontAwesomeIcons.bed,
                        iconcolor: Colors.purple,
                      ),
                      gfitcards(
                        title: 'Heart Rate',
                        icondata: FontAwesomeIcons.heartbeat,
                        iconcolor: Colors.redAccent,
                      ),
                      gfitcards(
                        title: 'Calories',
                        icondata: FontAwesomeIcons.fireAlt,
                        iconcolor: Colors.orange,
                        ontap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GfitCalories()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class gfitcards extends StatelessWidget {
  String title;
  IconData icondata;
  Color iconcolor;
  Function ontap;

  gfitcards({this.title, this.icondata, this.iconcolor, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.indigoAccent.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icondata,
              color: iconcolor,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyleMediumBlack,
            )
          ],
        ),
      ),
    );
  }
}
