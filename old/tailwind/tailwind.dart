import 'package:audioplayers/audioplayers.dart';
import 'package:halcyon/tailwind/player.dart';
import 'package:flutter/material.dart';
import 'package:halcyon/util/generic.dart';
import 'package:halcyon/util/intfs.dart';

const String TUnknownStr = "Unknown";
const TUnknownNum = -1;

/// Represents a standard Unknown Duration for a file.
const Duration TDurationUnknown = Duration(
    days: TUnknownNum,
    hours: TUnknownNum,
    minutes: TUnknownNum,
    seconds: TUnknownNum,
    milliseconds: TUnknownNum,
    microseconds: TUnknownNum);

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

/// Represents an appendable audio tag for an Audio File.
/// This is useful for when the user wants to customize how they categorize their playlists.
///
/// All tags are to be open to be searched (meaning they are all avaliable tags are stored in a global data structure)
typedef TMetaTag = ({
  String displayName,
  String description,
  Color tagColor,
  Icon icon
});

/// A list of all **supported** audio file formats in Tailwind.
///
/// These are the defacto formats that should be supported by the host system.
///
/// If not, then Halcyon will crash.
final List<TAudioFileFormatInfo> T_supportedFormats =
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

/// Uses [T_supportedFormats] to retrieve all of the file endings from them.
///
/// *Macro function*
List<String> T_supportedEndings() {
  List<String> res = [];
  for (var e in T_supportedFormats) {
    e.endings.forEach(res.add);
  }
  return res;
}

/// Represents the basic information carried by an Audio File.
/// If said data is not present, an "Unknown" quantity should be set.
///
/// This class should also be used for reading and writing such data as the standard Tailwind file format (*.twd)
class TFileMetaData {
  // ! Start Standard Metadata information (generic info that most players out there share)
  /// How long this audio piece lasts for
  Duration audioDuration;

  /// The title of this audio piece.
  ///
  /// If no suitable title is found, the file name can be suggested
  String title;

  /// Represents the system directory path to this audio file
  String filePath;

  /// The Audio Format in a String from [TAudioFileFormatInfo]
  String audioFormat;

  /// The artist that composed this piece (Group, Person, etc.)
  String artist;

  /// The beats per second of this audio piece.
  ///
  /// If not avaliable, Tailwind *should* calculate it on the fly
  double bps;

  // ! Start Tailwind Metadata information (info specific to the Halcyon Tailwind music player)
  /// how many times the user played the audio till full
  double hit;

  /// how many times the user manually selected this track
  double forcedHit;

  /// How many times the user pressed loop on this song
  double loopHit;

  /// How many times the user skipped this song
  double skipHit;

  /// Represents the total amount of time (**in seconds**) spent listening to this track
  double totalSecondsSpent;

  /// Comments; a note to the user themselves that they can also alter.
  String comments;

  /// represents a number out of 10 -> rating -> n where n will be represented by n/10
  ///
  /// **Must be unsigned >=0**
  double rating;

  /// If this piece of audio contains explicit content.
  ///
  /// The user must decide for themselves!!!
  bool isExplicit;

  /// Represents all of the audio tags that has been categorized with this audio file
  Set<TMetaTag> tags;

  /// **This value should be altered with care and never exposed to the end user for editing**
  ///
  /// This represents the likelihood of how much the user likes this song. This is on a scale 0<=n<=100
  double calculatedMeanPhiVal;

  /// Represents when was the last time this track was played in a [DateTime] object
  DateTime lastPlayed;

  TFileMetaData(
      {this.audioDuration = TDurationUnknown,
      this.title = TUnknownStr,
      this.artist = TUnknownStr,
      this.hit = 0,
      this.forcedHit = 0,
      this.bps = 0,
      this.comments = "",
      this.rating = 0,
      this.isExplicit = false,
      this.totalSecondsSpent = 0,
      Set<TMetaTag>? metaTags,
      this.calculatedMeanPhiVal = 0,
      this.loopHit = 0,
      this.skipHit = 0,
      this.filePath = "",
      this.audioFormat = TUnknownStr,
      DateTime? lastPlayed})
      : tags = metaTags ?? {},
        lastPlayed = lastPlayed ?? HDateTimeUnknown;
}

/// Finalized model used by Halcyon for actual playback of real time data.
final TailwindModel tailwind = TailwindModel();

class TailwindModel extends Tailwind
    with ChangeNotifier
    implements HToggleable {
  TailwindModel() {
    expose()
        .onPlayerStateChanged
        .listen((event) => notifyListeners());
  }

  PlayerState exposeState() => expose().state;

  /// Provides for accessing whether the current player is playing or not.
  bool isPlaying() =>
      super.expose().state == PlayerState.playing;

  @override
  void play() {
    super.play();
    notifyListeners();
  }

  @override
  void pause() {
    super.pause();
    notifyListeners();
  }

  @override
  void toggle() {
    if (isPlaying())
      pause();
    else
      play();
  }
}
