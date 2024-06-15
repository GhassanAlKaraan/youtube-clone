import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({required this.auth, required this.firestore});

  Future<void> addUserDataToFirestore(
      {required String displayName,
      required String userName,
      required String email,
      required String profilePic,
      required List subscriptions,
      required int videos,
      required String userId,
      required String description,
      required String type}) async {
    UserModel user = UserModel(
        displayName: displayName,
        userName: userName,
        email: email,
        profilePic: profilePic,
        subscriptions: [],
        videos: 0,
        userId: auth.currentUser!.uid,
        description: description,
        type: "user");

    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }
}
