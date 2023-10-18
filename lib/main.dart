import 'package:flutter/material.dart';
import 'package:halcyon_lite/apps/discord.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/homepage.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/tailwind.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
      const WindowOptions(size: Size(800, 480), center: true),
      () async {
    await windowManager.show();
    await windowManager.focus();
  });
  HassetContract.load();
  runApp(const HalcyonApp());
  initDiscordRPC();

  mainPlayer.setSource(HassetContract.assetAudio["rimworldOST"]!);
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
              activeTrackColor: PoprockLaF.primary2,
              inactiveTrackColor:
                  PoprockLaF.primary2.withOpacity(0.4),
              thumbColor: PoprockLaF.primary2,
              disabledThumbColor: PoprockLaF.primary2)),
      home: const HalcyonHome(),
    );
  }
}
