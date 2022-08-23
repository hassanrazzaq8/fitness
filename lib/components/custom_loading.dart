import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class CustomLoading extends StatefulWidget {
  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: mainaccent,
        size: 50.0,
        controller: AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1200)),
      ),
    );
  }
}
