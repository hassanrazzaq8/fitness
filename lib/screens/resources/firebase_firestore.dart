import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/models/user_model.dart';

class FireStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadUser(
    String uid,
    String email,
    String password,
    String age,
    String contact,
    String weight,
  ) async {
    String res = "Some error occcured";
    try {
      User user = User(
        uid: uid,
        email: email,
        password: password,
        age: age,
        contact: contact,
        weight: weight,
      );
      await _firestore.collection("Users").doc(uid).set(
            user.tojson(),
          );
      res = "success";
    } catch (e) {
      print(e);
    }
    return res;
  }
}
