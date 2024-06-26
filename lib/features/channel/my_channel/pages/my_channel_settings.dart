import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/edit_setting_dialog.dart';
import 'package:youtube_clone/features/channel/my_channel/repository/edit_field.dart';
import 'package:youtube_clone/features/channel/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
        data: (currentUser) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/flutter background.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.lightBlue,
                            backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 16,
                          child: Image.asset(
                            "assets/icons/camera.png",
                            height: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SettingsItem(
                      identifier: "Name",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                                  identifier: "Your new Display Name",
                                  onSave: (name) {
                                    ref
                                        .watch(editSettingsProvider)
                                        .editDisplayName(name);
                                  },
                                ));
                      },
                      value: currentUser.displayName,
                    ),
                    const SizedBox(height: 14),
                    SettingsItem(
                      identifier: "Handle",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                                  identifier: "Your new User Name",
                                  onSave: (userName) {
                                    ref
                                        .watch(editSettingsProvider)
                                        .editUserName(userName);
                                  },
                                ));
                      },
                      value: currentUser.userName,
                    ),
                    const SizedBox(height: 14),
                    SettingsItem(
                      identifier: "Description",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                                  identifier: "Your new Description",
                                  onSave: (description) {
                                    ref
                                        .watch(editSettingsProvider)
                                        .editDescription(description);
                                  },
                                ));
                      },
                      value: currentUser.description.isEmpty
                          ? "No Description"
                          : currentUser.description,
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Keep subscriptions private?"),
                          Switch(
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched = !_isSwitched;
                                });
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[500]),
                          "Changes made on your name and profile picture are only visible to YouTube and not other Google services"),
                    ),
                  ],
                ),
              ),
            ),
        error: (error, stackTrace) => const ErrorPage(),
        loading: () => const Loader());
  }
}
