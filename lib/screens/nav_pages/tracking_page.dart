import 'dart:math';

import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/tracking_data.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  @override
  TrackingPageState createState() => TrackingPageState();
}



class TrackingPageState extends State<TrackingPage>
{
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final _controller = new PageController();

    static const _kDuration = const Duration(milliseconds: 300);

    static const _kCurve = Curves.ease;

    final _kArrowColor = Colors.black.withOpacity(0.8);



    @override
    Widget build(BuildContext context) {

      final List<Widget> _pages = <Widget>[
        new ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Exercises",style: TextStyleHeadingBlackBold,),
                  SizedBox(height: 10,),
                  Text("To Your Personalized Profile",style: TextStyleFormBlack,),
                  SizedBox(height: 100,),
                  Image.asset("images/onboardsplash1.png")
                ],
              ),
            ),
          ),
        ),
        new ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Keep Eye On Health Tracking",style: TextStyleHeadingBlackBold,),
                  SizedBox(height: 10,),
                  Text("Get reminder about activities",style: TextStyleFormBlack,),
                  SizedBox(height: 100,),
                  Image.asset("images/onboardsplash2.png")
                ],
              ),
            ),
          ),
        ),
        new ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Check Your Progress",style: TextStyleHeadingBlackBold,),
                  SizedBox(height: 10,),
                  Text("Track your progress daily",style: TextStyleFormBlack,),
                  SizedBox(height: 100,),
                  Image.asset("images/onboardsplash3.png"),
                  SizedBox(height: 100,),
                  RoundButton(textval: 'DONE',height: 40,onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackingData()));
                  },)
                ],
              ),
            ),
          ),
        ),
      ];


      return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title:Text("Health Tracking")),
        drawer: NavDrawer(),
        body: new IconTheme(
          data: new IconThemeData(color: _kArrowColor),
          child: new Stack(
            children: <Widget>[
              new PageView.builder(
                physics: new AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),
              new Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: new Container(
                  color: Colors.grey[800].withOpacity(0.5),
                  padding: const EdgeInsets.all(20.0),
                  child: new Center(
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: _kDuration,
                          curve: _kCurve,
                        );
                      },
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

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

