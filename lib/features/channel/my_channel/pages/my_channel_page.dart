import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tab_bar.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tab_bar_view.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/top_buttons.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/top_header.dart';

class MyChannelPage extends ConsumerWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) => DefaultTabController(
              length: 7,
              child: Scaffold(
                body: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TopHeaderPart(
                        user: currentUser,
                      ),
                      const TopButtonsPart(),
                      // Tab Bar & Pages
                      const PageTabBar(),
                      const TabPages()
                    ],
                  ),
                )),
              )),
          error: (error, stackTrace) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
