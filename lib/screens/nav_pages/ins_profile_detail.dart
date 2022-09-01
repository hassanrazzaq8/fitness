import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'content_page.dart';
import 'chat_screen.dart';

class InsProfileDetailPage extends StatefulWidget {
  String? email;

  InsProfileDetailPage({this.email});

  @override
  _InsProfileDetailPageState createState() => _InsProfileDetailPageState();
}

class _InsProfileDetailPageState extends State<InsProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text('Instructor Detail'),
      ),
      body: Container(
        child: Column(
          children: [
            //header
            Container(
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 7.0,
                    ),
                  ],
                  color: mainaccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(400, 60),
                      bottomLeft: Radius.elliptical(400, 60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
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
                  Text(
                    widget.email!,
                    style: TextStyleForm,
                  )
                ],
              ),
            ),
            //body
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Material(
                              color: Colors.blue,
                              child: MaterialButton(
                                splashColor: Colors.amber,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(recvremail: widget.email,)));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.chat,size: 15,),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Material(
                              color: Colors.green,
                              child: MaterialButton(
                                splashColor: Colors.red,
                                onPressed: () {

                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.phone,size: 15,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Learning',
                      style: TextStyleHeadingBlack,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    InsProfileCards(
                      icondata: FontAwesomeIcons.fileAlt,
                      title: 'Content',
                      iconcolor: Colors.white70,
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContentPage(insemail: widget.email,)));
                      },
                    ),
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

class InsProfileCards extends StatelessWidget {
  String? title;
  IconData? icondata;
  Function? onpress;
  Color? iconcolor;

  InsProfileCards(
      {this.title, this.icondata, this.iconcolor, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 80,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.indigo,
        elevation: 5.0,
        child: MaterialButton(
          elevation: 5.0,
          onPressed: onpress as void Function()?,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Icon(
                icondata,
                color: iconcolor,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title!,
                style: TextStyleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
