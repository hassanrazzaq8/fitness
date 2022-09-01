import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Prects extends StatefulWidget {
  const Prects({Key? key}) : super(key: key);

  @override
  State<Prects> createState() => _PrectsState();
}

class _PrectsState extends State<Prects> {
  @override
  void initState() {
    super.initState();
    print("FirebaseAuth.instance.currentUser.uid.toString()");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        // FirebaseAuth.instance.currentUser.uid
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text(FirebaseAuth.instance.currentUser!.uid),
          );
          // if (snapshot.hasData) {
          //   return Center(
          //     child: Text(
          //       "${snapshot.data["height"].toString()}",
          //     ),
          //   );
          // }
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        },
      ),
    );
  }
}
