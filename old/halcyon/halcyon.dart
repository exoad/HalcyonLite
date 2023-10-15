import 'package:flutter/material.dart';
import 'package:halcyon/halcyon/theme.dart';
import 'package:halcyon/tailwind/tailwind.dart';
import 'package:halcyon/util/logger.dart';
import 'package:provider/provider.dart';

/// This class represents the barebones main metal part of the halcyon app.
///
/// **This is for the Halcyon main window ONLY**
final class HApp extends StatelessWidget {
  const HApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: hHalcyonTheme(),
        home: const Scaffold(body: HPBControls()));
  }
}

/// Represents the UI element that holds the play back controls such as timeline scrubbing,
/// play or pause, etc.. It does not contain play list management controls (although, next track and previous track
/// do count).
class HPBControls extends StatefulWidget {
  const HPBControls({super.key});

  @override
  State<HPBControls> createState() => _HPBControlsState();
}

/// Internal state definition declaration of what should be returned from this playback controller.
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
            SizedBox.fromSize(
                size: const Size.fromWidth(20)),
            Text(isPlaying ? "Playing" : "Paused",
                textAlign: TextAlign.center)
          ]);
        },
      ),
    );
  }
}
