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
    if (playerState == PlayerState.playing) {
      sampleEvent = ("Playing", Icons.play_arrow_rounded);
      MasterTags.addTag(
          "PlayerState",
          createSmallTag(
            icon: sampleEvent.$2,
            text: sampleEvent.$1,
          ));
    } else {
      MasterTags.removeTag("PlayerState");
    }
  });
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
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(HalcyonLLaf.arcRadius))),
            backgroundColor: PoprockLaF.bg,
            titleTextStyle: TextStyle(
                color: PoprockLaF.primary3,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            contentTextStyle: TextStyle(
                color: PoprockLaF.primary3,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: Colors.black),
          sliderTheme: SliderThemeData(
              overlappingShapeStrokeColor: transparentColor,
              overlayColor: transparentColor,
              trackHeight:
                  MediaQuery.of(context).devicePixelRatio * 4,
              activeTrackColor: PoprockLaF.primary1,
              inactiveTrackColor:
                  PoprockLaF.primary1.withOpacity(0.4),
              thumbColor: PoprockLaF.primary1,
              disabledThumbColor: PoprockLaF.primary1)),
      home: const HalcyonHome(),
    );
  }
}
