import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/dark_text_field.dart';
import 'package:fitnessapp/components/form_text_field.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firestore;
  FirebaseAuth auth;
  String userid;

  Future<void> getCurrentUser() async {
    auth = FirebaseAuth.instance;
    try {
      final user = await auth.currentUser;
      if (user != null) {
        setState(() {
          userid = user.email.toString().trim();
        });
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection("users");

    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavDrawer(),
        appBar: AppBar(title: Text("Profile")),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc(userid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Text("Loading Data...  Please wait",
                    style: TextStyleFormBlack),
              );
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Something went wrong',
                style: TextStyleFormBlack,
              ));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();

              return Column(
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
                                    image:
                                        AssetImage("images/profile_avatar.png"),
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
                            height: 40,
                          ),
                          Text(
                            data['email'].toString().trim(),
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
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Name",
                                        style: TextStyleFormBlackBold,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: DarkTextField(
                                      inputtype: TextInputType.text,
                                      inputval: data['name'].toString().trim(),
                                      onChanged: (String getName) {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Age",
                                        style: TextStyleFormBlackBold,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: DarkTextField(
                                      inputtype: TextInputType.number,
                                      inputval: data['age'].toString().trim(),
                                      onChanged: (String getAge) {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Height",
                                        style: TextStyleFormBlackBold,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: DarkTextField(
                                      inputtype: TextInputType.number,
                                      inputval:
                                          data['height'].toString().trim(),
                                      onChanged: (String getheight) {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Weight",
                                        style: TextStyleFormBlackBold,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: DarkTextField(
                                      inputtype: TextInputType.number,
                                      inputval:
                                          data['weight'].toString().trim(),
                                      onChanged: (String getWeight) {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Contact",
                                        style: TextStyleFormBlackBold,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: DarkTextField(
                                      inputtype: TextInputType.number,
                                      inputval:
                                          data['contact'].toString().trim(),
                                      onChanged: (String getEmail) {},
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
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
              );
            }
            return Center(child: Text("Loading", style: TextStyleFormBlack));
          },
        ));
    //   body: StreamBuilder(
    //     stream: firestore
    //         .collection("users").snapshots(),
    //     builder: (context, AsyncSnapshot<QuerySnapshot<Map<dynamic, String>>> snapshot) {
    //       if (ConnectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       return Column(
    //         children: [
    //           Text(
    //             snapshot.data["name"].toString(),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
  }
}
