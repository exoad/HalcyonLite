import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/laf.dart';
import 'package:halcyon_lite/parts/tailwind/tailwind.dart';
import 'package:halcyon_lite/parts/util.dart';

class TailwindDurationSeek extends StatefulWidget {
  const TailwindDurationSeek({super.key});

  @override
  State<TailwindDurationSeek> createState() =>
      _TailwindDurationSeekState();
}

class _TailwindDurationSeekState extends State<TailwindDurationSeek> {
  bool seeking = false;

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onSeekComplete.listen((_) {
      setState(() {
        seeking = true;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          seeking = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return seeking
        ? createSmallTag(
            bg: PoprockLaF.primary2,
            text: "Seeking",
            icon: Icons.timer_rounded)
        : const SizedBox();
  }
}

class TailwindStateTag extends StatefulWidget {
  const TailwindStateTag({super.key});

  @override
  State<TailwindStateTag> createState() => _TailwindStateTagState();
}

class _TailwindStateTagState extends State<TailwindStateTag> {
  PlayerState playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onPlayerStateChanged.listen((event) {
      setState(() {
        playerState = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return createSmallTag(
        text: playerState.name.characters.elementAt(0).toUpperCase() +
            playerState.name.substring(1),
        icon: Icons.music_note_rounded,
        bg: PoprockLaF.primary3);
  }
}
