import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserChatscreen extends StatefulWidget {
  final String recvremail;

  UserChatscreen({required this.recvremail});

  @override
  _UserChatscreenState createState() => _UserChatscreenState();
}

class _UserChatscreenState extends State<UserChatscreen> {
  String currentuser = FirebaseAuth.instance.currentUser!.email.toString();
  String? msg;
  final textfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minerva Chat'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => VideoCall(),
              //   ),
              // );
            },
            icon: Icon(Icons.video_camera_front),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentuser)
                  .collection('chats')
                  .doc(currentuser + " and " + widget.recvremail)
                  .collection('msgs')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs.reversed;
                  List<msgbubble> messageWidgets = [];
                  for (var msg in messages) {
                    final msgtext = msg['text'];
                    final msgSender = msg['sender'];
                    final msgtime = msg['time'];

                    final messagebubble = msgbubble(
                      text: msgtext,
                      sender: msgSender,
                      time: msgtime,
                      isMe: currentuser == msgSender,
                    );

                    messageWidgets.add(messagebubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: messageWidgets,
                    ),
                  );
                }
                return Container();
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textfieldcontroller,
                      onChanged: (String text) {
                        msg = text;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyleFormBlack,
                      decoration: InputDecoration(
                        hintText: "Enter Message",
                        hintStyle: TextStyle(fontSize: 18, color: mainaccent),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainaccent),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                      height: 50,
                      color: Colors.grey[200],
                      onPressed: () {
                        setState(() {
                          print(widget.recvremail);
                          textfieldcontroller.clear();
                          sendtext(text: msg);
                        });
                      },
                      child: Text('Send',
                          style: TextStyle(color: mainaccent, fontSize: 18)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendtext({String? text}) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm a yy-MM-dd ');
    String formattedDate = formatter.format(now);

    var formattertime = new DateFormat('hh:mm');
    String formattedtime = formattertime.format(now);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser)
        .collection('chats')
        .doc(currentuser + " and " + widget.recvremail)
        .collection('msgs')
        .doc()
        .set({
          'sender': currentuser,
          'text': text,
          // 'date': formattedDate.toString(),
          'time': formattedtime.toString(),
          'timestamp': FieldValue.serverTimestamp(),
        })
        .then((value) => print('Sent text'))
        .catchError((error) => print("Failed to sent text: $error"));
  }
}

class msgbubble extends StatelessWidget {
  String? text;
  String? sender;
  String? time;
  bool? isMe;

  msgbubble({this.text, this.sender, this.time, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender!,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe!
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5.0,
            color: isMe! ? Colors.indigo : Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    text!,
                    style: TextStyle(
                        fontSize: 15,
                        color: isMe! ? Colors.white : Colors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    time!,
                    style: TextStyle(
                        fontSize: 10,
                        color: isMe! ? Colors.grey[200] : Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
