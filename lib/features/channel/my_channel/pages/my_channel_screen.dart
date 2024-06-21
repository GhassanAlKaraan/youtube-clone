import 'package:flutter/material.dart';

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
            Row(
              
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Manage Subs",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                            ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
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
            // ImageButton(onPressed: (){}, image: "", haveColor: true)
            ],)
          ],
        ),
      )),
    );
  }
}
