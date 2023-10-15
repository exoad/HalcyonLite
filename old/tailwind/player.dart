import 'package:audioplayers/audioplayers.dart';
import 'package:halcyon/util/intfs.dart';
import 'package:halcyon/util/logger.dart';
import 'package:halcyon/tailwind/tailwind.dart';

enum TPlayerState {
  PB_START,
  PB_PAUSE,
  PB_KILL;
}

/// The **Tailwind** class provides the defaults for all audio interfacing. It represents the minimal barebones interface between [audioplayers] package and the Halcyon program.\
class Tailwind implements HExposable<AudioPlayer> {
  final AudioPlayer _player;

  /// Inits the items of the Tailwind Player.
  Tailwind() : _player = AudioPlayer() {
    _player.eventStream.listen((event) => hLog(
        HLogLevel.LOW,
        "Received an AUDIO_EVENT of [${event.eventType.name.toUpperCase()}] @ ${event.position}"));
  }

  void setSource(Source source) {
    if (_player.state != PlayerState.stopped)
      stop();
    _player.setSource(source);
  }

  @override
  AudioPlayer expose() => _player;

  /// Starts playing the audio. This is also a `resume` functionality.
  void play() => _player.resume();

  /// Returns the current source being played
  Source source() => _player.source!;

  /// Stops playing the audio and does not modify the current timestamp.
  void pause() => _player.pause();

  /// Stops playing the audio and resets the current timestamp to `0`.
  void stop() => _player.stop();

  /// Tells whether to loop the current track or not.
  ///
  /// `true` means [ReleaseMode.loop] will be used
  ///
  /// `false` means [ReleaseMode.release] will be used; this is the default behavior for the audioplayers package.
  void setLoop(bool loopTrack) => _player.setReleaseMode(
      loopTrack ? ReleaseMode.loop : ReleaseMode.release);

  /// Sets the balance between the left and right.
  ///
  /// `-1` represents full left
  ///
  /// `1` represents full right
  ///
  /// **This might not be supported on all platforms**
  void setBalance(double balance) =>
      _player.setBalance(balance);

  /// Sets the volume of the player from silent to loud.
  ///
  /// `0` represents silent
  ///
  /// `1` represents the max loudness
  void setVolume(double volume) =>
      _player.setVolume(volume);

  /// Returns the duration of the current media.
  ///
  /// [Duration.zero] is returned if a `null` is found by the internal _player.
  Future<Duration> duration() async =>
      await _player.getDuration() ?? TDurationUnknown;

  Future<Duration> position() async =>
      await _player.getCurrentPosition() ??
      TDurationUnknown;

  /// Play the next song in the queue. Skips the current.
  ///
  /// [dropCurr] - Whether the song to skip over should be removed from the queue entirely
  void next(bool dropCurr) {}

  /// Play the previous song in the queue. Skips the current.
  ///
  /// [dropCurr] - Whether the song to skip over should be removed from the queue entirely
  void back(bool dropCurr) {}
}
