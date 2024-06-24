import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.blueGrey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Ghassan Al Karaan',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: "@ghassan-alkaraan "),
                      TextSpan(text: "No Subscriptions "),
                      TextSpan(text: "No Videos"),
                    ]),
              ),
            ),
            const Text(
              "More about this channel",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: softBlueGreyBackGround,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Manage Videos",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ImageButton(
                          onPressed: () {}, image: "pen.png", haveColor: true)),
                  Expanded(
                      flex: 1,
                      child: ImageButton(
                          onPressed: () {},
                          image: "time.png",
                          haveColor: true)),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
