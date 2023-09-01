import 'package:flutter/material.dart';
import 'package:halcyon/tailwind/tailwind.dart';
import 'package:halcyon/util/logger.dart';
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

class HPBControls extends StatefulWidget {
  const HPBControls({super.key});

  @override
  State<HPBControls> createState() => _HPBControlsState();
}

class _HPBControlsState extends State<HPBControls> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider.value(
        value: tailwind,
        builder: (context, widget) {
          bool isPlaying = Provider.of<TailwindModel>(
                  context,
                  listen: false)
              .isPlaying();
          hLog(HLogLevel.LOW,
              "Received isPlaying $isPlaying");
          return Row(children: [
            if (isPlaying)
              IconButton(
                  onPressed: () =>
                      setState(tailwind.toggle),
                  icon: const Icon(Icons.pause_rounded,
                      size: 46))
            else
              IconButton(
                  onPressed: () =>
                      setState(tailwind.toggle),
                  icon: const Icon(Icons.play_arrow_rounded,
                      size: 46)),
            Text(isPlaying ? "Playing" : "Paused")
          ]);
        },
      ),
    );
  }
}
