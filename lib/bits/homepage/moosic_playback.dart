import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/parts.dart';

class HPlaybackButton extends StatefulWidget {
  const HPlaybackButton({super.key});

  @override
  State<HPlaybackButton> createState() => HPlaybackButtonState();
}

class HPlaybackButtonState extends State<HPlaybackButton> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onPlayerStateChanged.listen((playerState) {
      setState(() {
        isPlaying = playerState == PlayerState.playing;
      });
    });
  }

  void _togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        mainPlayer.play();
      } else {
        mainPlayer.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: isPlaying
                  ? PoprockLaF.primary2
                  : PoprockLaF.primary1,
              borderRadius: const BorderRadius.all(
                  Radius.circular(HalcyonLLaf.arcRadius))),
          child: Center(
              child: IconButton(
            splashColor: transparentColor,
            highlightColor: transparentColor,
            onPressed: _togglePlay,
            icon: Icon(
                isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: PoprockLaF.bg),
            iconSize: HalcyonLLaf.bigButtonIconSize,
          ))),
    );
  }
}
