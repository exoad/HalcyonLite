import 'package:flutter/material.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/homepage.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/tailwind.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HassetContract.load();
  runApp(const HalcyonApp());
  mainPlayer.setSource(HassetContract.assetAudio["darbyRelive"]!);
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
