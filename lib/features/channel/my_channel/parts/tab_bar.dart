import 'package:flutter/material.dart';

class PageTabBar extends StatelessWidget {
  const PageTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: TabBar(
          controller: null,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(top: 12),
          isScrollable: true,
          tabs: [
            Text("Home"),
            Text("Videos"),
            Text("Shorts"),
            Text("Community"),
            Text("Playlists"),
            Text("Channels"),
            Text("About"),
          ]),
    );
  }
}
