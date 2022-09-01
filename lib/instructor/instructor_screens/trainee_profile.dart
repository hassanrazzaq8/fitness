import 'package:fitnessapp/Instructor/ins_nav_drawer.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/material.dart';

class TraineeProfile extends StatefulWidget {
  @override
  _TraineeProfileState createState() => _TraineeProfileState();
}

class _TraineeProfileState extends State<TraineeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trainee Profile")),
      drawer: InsNavDrawer(),
      body: Container(
        child: Column(
          children: [
            //header
            Container(
              height: 210,
              padding: EdgeInsets.only(bottom: 20, top: 10),
              decoration: BoxDecoration(
                  color: mainaccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(400, 60),
                      bottomLeft: Radius.elliptical(400, 60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/profile_avatar.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
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
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x93000000),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: MaterialButton(
                            splashColor: Colors.transparent,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.chat),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x93000000),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: MaterialButton(
                            splashColor: Colors.transparent,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.call),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyleFormBlackBold,
                        ),
                        Text(
                          "Shahroz Javed",
                          style: TextStyleFormBlack,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight: ",
                          style: TextStyleFormBlackBold,
                        ),
                        Text(
                          "0",
                          style: TextStyleFormBlack,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "height: ",
                          style: TextStyleFormBlackBold,
                        ),
                        Text(
                          "0",
                          style: TextStyleFormBlack,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
