import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:halcyon/tailwind/tailwind.dart';

/// The **Tailwind** class provides the defaults for all audio interfacing. It represents the minimal barebones interface between [audioplayers] package and the Halcyon program.
class Tailwind {
  final AudioPlayer _player;
  final ListQueue<Source> _audioQueue;

  Tailwind()
      : _player = AudioPlayer(),
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

  /// Returns the duration of the current media.
  ///
  /// [Duration.zero] is returned if a `null` is found by the internal player.
  Future<Duration> duration() async => await _player.getDuration() ?? TDurationUnknown;

  Future<Duration> position() async => await _player.getCurrentPosition() ?? TDurationUnknown;

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
