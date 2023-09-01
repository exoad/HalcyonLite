import 'package:audioplayers/audioplayers.dart';
import 'package:halcyon/tailwind/player.dart';
import 'package:flutter/material.dart';
import 'package:halcyon/util/toggleable.dart';

/// Represents a standard
const TDurationUnknown = Duration(
    days: -1,
    hours: -1,
    minutes: -1,
    seconds: -1,
    milliseconds: -1,
    microseconds: -1);

/// Represents a structure of allowed file types in a typedef
///
/// [id] - The file format ID, usually just the file extension but in uppercase
///
/// [endings] - A `List<String>` of all associated file extensions
///
/// [formalName] - The formal name of the file format
typedef TAudioFileFormatInfo = ({
  String id,
  List<String> endings,
  String formalName,
});

final T_supportedFormats =
    List.unmodifiable(<TAudioFileFormatInfo>[
  (
    id: "MP3",
    endings: ["mp3"],
    formalName: "MPEG Audio Layer III"
  ),
  (id: "WAV", endings: ["wav"], formalName: "WaveForm"),
  (id: "OGG", endings: ["ogg", "oga"], formalName: "OGG"),
  (
    id: "FLAC",
    endings: ["flac"],
    formalName: "Free Lossless Audio Codec"
  ),
  (
    id: "AAC",
    endings: ["aac"],
    formalName: "Advanced Audio Coding"
  )
]);

List<String> T_supportedEndings() {
  List<String> res = [];
  for (var e in T_supportedFormats) {
    e.endings.forEach(res.add);
  }
  return res;
}

final TailwindModel tailwind = TailwindModel();

class TailwindModel extends Tailwind
    with ChangeNotifier
    implements HToggleable {
  /// Provides for accessing whether the current player is playing or not.
  ///
  /// Note [isStopped] is inversing the call of [isStarted]
  bool isPlaying() =>
      super.expose().state == PlayerState.playing;
  bool isStopped() => !isPlaying();

  @override
  void play() {
    super.play();
    notifyListeners();
  }

  @override
  void toggle() {
    if (isPlaying())
      pause();
    else
      play();
    notifyListeners();
  }
}
