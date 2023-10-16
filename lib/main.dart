import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/apps/discord.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/homepage.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/tailwind.dart';
import 'package:halcyon_lite/util.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
      const WindowOptions(size: Size(600, 300), center: true),
      () async {
    await windowManager.show();
    await windowManager.focus();
  });
  HassetContract.load();
  runApp(const HalcyonApp());
  initDiscordRPC();

  mainPlayer.setSource(HassetContract.assetAudio["rimworldOST"]!);
  mainPlayer.player.onPlayerStateChanged.listen((playerState) {
    (String, IconData) sampleEvent;
    if (playerState == PlayerState.playing)
      sampleEvent = ("Playing", Icons.play_arrow_rounded);
    else if (playerState == PlayerState.paused)
      sampleEvent = ("Paused", Icons.pause_rounded);
    else if (playerState == PlayerState.stopped)
      sampleEvent = ("Stopped", Icons.stop_rounded);
    else if (playerState == PlayerState.completed)
      sampleEvent = ("Completed", Icons.check_circle_rounded);
    else
      sampleEvent = ("Unknown", Icons.question_mark_rounded);
    MasterTags.addTag(
        "PlayerState",
        createSmallTag(
          icon: sampleEvent.$2,
          text: sampleEvent.$1,
        ));
  });

  MasterTags.addTag("HalcyonDiscordRPCLayer", const DiscordRPCTag());
}

class HalcyonApp extends StatelessWidget {
  const HalcyonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Halcyon",
      theme: ThemeData(
          primaryColor: PoprockLaF.primary1,
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: Colors.black)),
      home: const HalcyonHome(),
    );
  }
}
