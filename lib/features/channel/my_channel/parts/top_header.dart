// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

class TopHeaderPart extends StatelessWidget {
  final UserModel user;
const TopHeaderPart({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: CachedNetworkImageProvider(user.profilePic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    user.displayName,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "${user.userName} - "),
                          TextSpan(text: "${user.subscriptions.length} Subs - "),
                          TextSpan(text: "${user.videos} Vids"),
                        ]),
                  ),
                ),
      ],
    );
  }
}
