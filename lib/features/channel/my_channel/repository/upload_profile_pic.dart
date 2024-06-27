import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final uploadProfilePicProvider = Provider((ref) => UploadProfilePic(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
    storage: FirebaseStorage.instance));

class UploadProfilePic {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  UploadProfilePic(
      {required this.firestore, required this.auth, required this.storage});

  ///
  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      // Upload to Firebase Storage
      String fileName =
          'images/${auth.currentUser!.email}/profilePic/${DateTime.now().millisecondsSinceEpoch}.png';
      Reference storageReference = storage
          .refFromURL('gs://youtube-clone-ghassan.appspot.com')
          .child(fileName);
      UploadTask uploadTask = storageReference.putFile(file);

      await uploadTask.whenComplete(() async {
        String downloadURL = await storageReference.getDownloadURL();

        // Save the URL in Firestore
        await updateProfilePic(downloadURL);
      });
    }
  }

  updateProfilePic(String profilePic) async {
    firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"profilePic": profilePic});
  }
}