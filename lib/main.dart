import 'package:flutter/material.dart';
import 'package:halcyon/homepage.dart';

void main() {
  runApp(const HalcyonApp());
}

class HalcyonApp extends StatelessWidget {
  const HalcyonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Halcyon",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalcyonHome(),
    );
  }
}
