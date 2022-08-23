import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleUi extends StatefulWidget {
  @override
  _SampleUiState createState() => _SampleUiState();
}

class _SampleUiState extends State<SampleUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 100,
        width: double.infinity,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //leftside borders
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            //                   <--- left side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                          top: BorderSide(
                            //                    <--- top side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            //                   <--- left side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                          bottom: BorderSide(
                            //                    <--- top side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Middle text
              Text(
                'This item has no bar code',
                style: TextStyle(fontSize: 20),
              ),
              //Right Side borders
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            //                   <--- left side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                          top: BorderSide(
                            //                    <--- top side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            //                   <--- left side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                          bottom: BorderSide(
                            //                    <--- top side
                            color: Colors.grey,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
