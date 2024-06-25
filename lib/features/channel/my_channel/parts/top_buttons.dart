import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class TopButtonsPart extends StatelessWidget {
  const TopButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      image: "time-watched.png",
                      haveColor: true)),
            ],
          ),
        ),
      ],
    );
  }
}
