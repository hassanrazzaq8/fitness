import 'dart:html';

import 'package:fitnessapp/screens/nav_pages/friends.dart';
import 'package:fitnessapp/screens/nav_pages/instructor_page.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Messages"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Instructor",
              ),
              Tab(
                text: "Friends",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InstructorPage(),
            // Center(
            //   child: Text(
            //     "Instructor Messages",
            //   ),
            // ),
            FriendsPage(),
            // Center(
            //   child: Text(
            //     "Friends Messages",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
