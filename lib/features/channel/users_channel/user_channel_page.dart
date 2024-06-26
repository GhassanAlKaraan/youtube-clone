import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class UserChannelPage extends StatefulWidget {
  const UserChannelPage({super.key});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  bool haveVideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              "assets/images/flutter background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: Row(
              children: [
                CircleAvatar(radius: 35, backgroundColor: Colors.grey[500]),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Damon",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    const Text("@developer",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(text: "No Subs "),
                          TextSpan(text: "No Vids"),
                        ]))
                  ],
                ),
                const Spacer(),
                FlatButton(
                    text: "Subscribe",
                    onPressed: () {},
                    color: Colors.red.shade400)
              ],
            ),
          ),
          haveVideos
              ? const SizedBox()
              : const Expanded(
                  child:
                      Center(child: Text("This channel has no videos"))),
        ],
      )),
    );
  }
}
