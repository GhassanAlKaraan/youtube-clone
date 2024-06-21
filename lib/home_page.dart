// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/custom_button.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/auth/respository/auth_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/youtube.jpg",
                  height: 36,
                ),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: "cast.png",
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: "notification.png",
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: "search.png",
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(currentUserProvider).when(
                        data: (currentUser) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blueGrey,
                                backgroundImage: CachedNetworkImageProvider(currentUser.profilePic),
                              ),
                            ),
                        error: (error, stackTrace) => const ErrorPage(),
                        loading: () => const Loader());
                  },
                ),
              ],
            ),
            Expanded(
                child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Home Page",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  CustomButton(
                      iconData: Icons.logout, onTap: 
                      
                      () async{

                        await ref.read(authServiceProvider).signOut();
                      }, haveColor: true)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
