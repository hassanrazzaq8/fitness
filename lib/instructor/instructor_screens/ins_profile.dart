import 'package:fitnessapp/components/dark_text_field.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ins_nav_drawer.dart';

class InsProfilePage extends StatefulWidget {
  @override
  _InsProfilePageState createState() => _InsProfilePageState();
}

class _InsProfilePageState extends State<InsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: InsNavDrawer(),
      appBar: AppBar(title: Text("Instructor Profile")),
      body: Column(
        children: [
          //FIRST ONE
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              decoration: BoxDecoration(
                  color: mainaccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(400, 60),
                      bottomLeft: Radius.elliptical(400, 60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            image: AssetImage(
                                "images/profile_avatar.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: mainaccent,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "shahrozjaved39@gmail.com",
                    style: TextStyleForm,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DarkTextField(
                        inputtype: TextInputType.text,
                        inputval: "Name",
                        onChanged: (String getName) {},
                      ),
                      DarkTextField(
                        inputtype: TextInputType.number,
                        inputval: "Contact",
                        onChanged: (String getEmail) {},
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundButton(
                        textval: "Update",
                        height: 40,
                        width: 100,
                        onpress: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
