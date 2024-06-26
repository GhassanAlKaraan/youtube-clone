import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider((ref) => AuthService(
      auth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ));

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;

  AuthService({required this.auth, required this.googleSignIn});

  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    // Sign out from Firebase Auth
    await auth.signOut();
    // Sign out from Google Sign-In provider
    await googleSignIn.signOut();
  }
}
