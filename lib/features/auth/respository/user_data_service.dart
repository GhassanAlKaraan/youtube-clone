import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataService {
  // I need to work with these 2 services.
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({required this.auth, required this.firestore});

  addUserDataToFirestore() async {
    // final user = auth.currentUser;
    // if (user != null) {
    //   firestore
    //       .collection("users")
    //       .doc(user.uid)
    //       .set({"name": user.displayName, "email": user.email});
    // }
  }
}
