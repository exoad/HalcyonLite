import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: PlayState(),
        ),
      ),
    );
  }
}

class PlayState extends StatefulWidget {
  const PlayState({
    super.key,
  });

  @override
  State<PlayState> createState() => _PlayStateState();
}

class _PlayStateState extends State<PlayState> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _init_audio();
  }

  void _init_audio() async {}

  void _alter() async {
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _alter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(isPlaying ? "Playing media!" : "Playing nothing...",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 32)),
            const SizedBox(height: 15),
            Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                size: 64),
          ],
        ));
  }
}

final Tailwind tailwind = Tailwind();

class Tailwind {
  final AudioPlayer _player1, _player2;
  final ListQueue<Source> audioQueue;

  Tailwind()
      : _player1 = AudioPlayer(),
        _player2 = AudioPlayer(),
        audioQueue = ListQueue<Source>();

  
}
