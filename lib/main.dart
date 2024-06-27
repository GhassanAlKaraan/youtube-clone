// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/firebase_options.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/pages/login_page.dart';
import 'package:youtube_clone/features/auth/pages/username_page.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/my_channel_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp())); // ProviderScope is For RiverPod
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<void> uploadImage() async{
    
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.active) {
            //   if (snapshot.hasData) {
            //     return HomePage();
            //   } else {
            //     return LoginPage();
            //   }
            // } else if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Loader();
            // } else {
            //   return LoginPage();
            // }

            if (!snapshot.hasData) {
              return LoginPage();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Loader();
            }
            // Check connection to firestore db
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final user = FirebaseAuth.instance.currentUser;
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return UsernamePage(
                        email: user!.email!,
                        displayName: user.displayName!,
                        profilePic: user.photoURL!);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Loader();
                  }
                  return MyChannelSettings();
                });
          })),
    );
  }
}
