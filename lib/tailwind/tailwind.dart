import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final Tailwind tailwind = Tailwind();

class Tailwind {
  final AudioPlayer _player1, _player2;
  final ListQueue<Source> audioQueue;

  Tailwind()
      : _player1 = AudioPlayer(),
        _player2 = AudioPlayer(),
        audioQueue = ListQueue<Source>();

  /// Procures an [AudioPlayer] instance to be set with a source
  /// This should be used with caution if the AudioPlayer is still in the process of playing
  void _load(AudioPlayer player, Source source) => player.setSource(source);

  void enqueue(Source source) => audioQueue.add(source);
}

class TailwindModel extends ChangeNotifier {}

typedef TAudioFileFormatInfo = ({
  String id,
  List<String> endings,
  String formalName,
});

final supportedFormats = List.unmodifiable(<TAudioFileFormatInfo>[
  (id: "MP3", endings: ["mp3"], formalName: "MPEG Audio Layer III"),
  (id: "WAV", endings: ["wav"], formalName: "WaveForm"),
  (id: "OGG", endings: ["ogg", "opus", "oga"], formalName: "OGG"),
  (id: "FLAC", endings: ["flac"], formalName: "Free Lossless Audio Codec"),
  (id: "AAC", endings: ["aac"], formalName: "Advanced Audio Coding")
]);
