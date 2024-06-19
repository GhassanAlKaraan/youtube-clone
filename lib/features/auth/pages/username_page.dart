import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/respository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  const UsernamePage(
      {required this.email,
      required this.displayName,
      required this.profilePic,
      super.key});

  final String email;
  final String displayName;
  final String profilePic;

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController _usernameController = TextEditingController();

  bool isValid = true;
  Future<void> validateUsername() async {
    final QuerySnapshot<Map<String, dynamic>> usersMap =
        await FirebaseFirestore.instance.collection("users").get();

    final List users =
        usersMap.docs.map((user) => user).toList(); // List of firestore docs

    String? targetedUsername;

    for (var user in users) {
      if (user.data()["username"] == _usernameController.text) {
        targetedUsername = user.data()["username"];
        isValid = false;
        setState(() {});
      }
      if (targetedUsername != _usernameController.text) {
        isValid = true;
        setState(() {});
      }
    }
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (username) {
                    validateUsername();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username) {
                    return isValid ? null : "Username is already taken";
                  },
                  key: formKey,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    suffixIcon: isValid
                        ? const Icon(Icons.verified_user_rounded)
                        : const Icon(Icons.error),
                    suffixIconColor: isValid ? Colors.green : Colors.red,
                    hintText: "Insert Username",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                const Spacer(),
                FlatButton(
                    text: isValid ? "Continue" : "Invalid Username",
                    onPressed: isValid
                        ? () async {
                            isValid
                                ? await ref
                                    .read(userDataServiceProvider)
                                    .addUserDataToFirestore(
                                        displayName: widget.displayName,
                                        userName:
                                            _usernameController.text.trim(),
                                        email: widget.email,
                                        profilePic: widget.profilePic,
                                        description: "")
                                : null;
                          }
                        : () {},
                    color: isValid ? Colors.green : Colors.black87)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
