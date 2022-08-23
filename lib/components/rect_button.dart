import 'package:flutter/material.dart';
import 'constants.dart';

class RectButton extends StatelessWidget {
  String textval;
  double height;
  double width;
  Function onpress;


  RectButton({this.textval, this.height, this.width,this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 5.0,
        color: mainaccent,
        child: MaterialButton(
          splashColor: Colors.transparent,
          onPressed: onpress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.white, width: 1)
          ),
          child: Text(textval, style: TextStyleForm),
        ),
      ),
    );
  }
}
