import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: library_private_types_in_public_api
final _Tailwind tailwind = _Tailwind();

/// The **Tailwind** class provides the defaults for all audio interfacing. It represents the minimal barebones interface between [audioplayers] package and the Halcyon program.
class _Tailwind {
  final AudioPlayer _player1, _player2;
  final ListQueue<Source> _audioQueue;

  _Tailwind()
      : _player1 = AudioPlayer(),
        _player2 = AudioPlayer(),
        _audioQueue = ListQueue<Source>();

  /// Procures an [AudioPlayer] instance to be set with a source
  /// This should be used with caution if the AudioPlayer is still in the process of playing
  void _load(AudioPlayer player, Source source) => player.setSource(source);

  /// Loads a source into the queue. **Does not start playing**
  void enqueue(Source source) => _audioQueue.add(source);

  /// Starts playing the audio. This is also a `resume` functionality.
  void play() {}

  /// Stops playing the audio and does not modify the current timestamp.
  void pause() {}

  /// Stops playing the audio and resets the current timestamp to `0`.
  void stop() {}

  /// Play the next song in the queue. Skips the current.
  ///
  /// [dropCurr] - Whether the song to skip over should be removed from the queue entirely
  void next(bool dropCurr) {}

  /// Play the previous song in the queue. Skips the current.
  ///
  /// [dropCurr] - Whether the song to skip over should be removed from the queue entirely
  void back(bool dropCurr) {}

  /// Returns a reference to the current audio queue.
  ///
  /// **Use with caution**
  ListQueue<Source> peek() => _audioQueue;
}

class TailwindModel extends _Tailwind with ChangeNotifier {}

typedef TAudioFileFormatInfo = ({
  String id,
  List<String> endings,
  String formalName,
});

final supportedFormats = List.unmodifiable(<TAudioFileFormatInfo>[
  (id: "MP3", endings: ["mp3"], formalName: "MPEG Audio Layer III"),
  (id: "WAV", endings: ["wav"], formalName: "WaveForm"),
  (id: "OGG", endings: ["ogg", "oga"], formalName: "OGG"),
  (id: "FLAC", endings: ["flac"], formalName: "Free Lossless Audio Codec"),
  (id: "AAC", endings: ["aac"], formalName: "Advanced Audio Coding")
]);

List<String> supportedEndings() {
  List<String> res = [];
  for (var e in supportedFormats) {
    e.endings.forEach(res.add);
  }
  return res;
}
