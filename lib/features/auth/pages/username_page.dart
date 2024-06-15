import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {

  final TextEditingController _usernameController = TextEditingController();
  void validateUsername() async{
    final QuerySnapshot<Map<String, dynamic>> usersMap = await FirebaseFirestore.instance.collection("users").get();
 
 
 
 
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 26),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Enter your username"),
                const SizedBox(height: 10,),
                TextFormField(
                  key: formKey,
            
                  controller: _usernameController,
                  
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.verified_user_rounded),
                    suffixIconColor: Colors.green,
                    hintText: "Insert Username",
            
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                const Spacer(),
                FlatButton(text: "Continue", onPressed: (){}, color: Colors.green)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
