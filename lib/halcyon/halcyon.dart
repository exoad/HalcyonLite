import 'package:flutter/material.dart';
import 'package:halcyon/tailwind/tailwind.dart';
import 'package:provider/provider.dart';

class HApp extends StatelessWidget {
  const HApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HPBControls()));
  }
}

class HPBControls extends StatelessWidget {
  const HPBControls({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: tailwind,
      builder: (context, widget) {
        bool isPlaying =
            Provider.of<TailwindModel>(context, listen: false).isPlaying();
        
        return const Row();
      },
    );
  }
}
