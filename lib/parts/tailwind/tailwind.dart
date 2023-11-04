import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:audiotags/audiotags.dart';
import 'package:flutter/material.dart';

typedef Tailwind = AudioPlayer;

HAudioPlayer mainPlayer = HAudioPlayer();

class HAudioPlayer with ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  StreamController<Tag> _tagStreamController =
      StreamController<Tag>.broadcast();
  Stream<Tag> get tagStream => _tagStreamController.stream;
  Tag? tag;

  HAudioPlayer() {
    _initializeListeners();
  }

  String getSource() {
    if (player.source.runtimeType == AssetSource) {
      return "assets/${(player.source as AssetSource).path}";
    } else if (player.source.runtimeType == UrlSource) {
      return (player.source as UrlSource).url;
    } else if (player.source.runtimeType == DeviceFileSource) {
      return (player.source as DeviceFileSource).path;
    } else {
      return "???";
    }
  }

  void _initializeListeners() {
    addListener(() async {
      if (player.source.runtimeType == AssetSource) {
        tag = await AudioTags.read(
            "assets/${(player.source as AssetSource).path}");
      } else if (player.source.runtimeType == UrlSource) {
        tag = await AudioTags.read((player.source as UrlSource).url);
      } else if (player.source.runtimeType == DeviceFileSource) {
        tag = await AudioTags.read(
            (player.source as DeviceFileSource).path);
      }
      _tagStreamController.sink.add(tag!);
    });
    player.onPlayerStateChanged.listen((event) =>
        print("[AUDIO]: State [${event.name.toUpperCase()}]"));
        player.eventStream.listen((event) => print("[AUDIO]: Event [${event.toString().toUpperCase()}]"));
    player.onLog.listen((msg) => print("[AUDIO]: $msg"));
  }

  @override
  void dispose() {
    _tagStreamController.close();
    super.dispose();
  }

  Future<void> setSource(Source source) async {
    assert(source.runtimeType != BytesSource,
        "BytesSource is not supported");
    await source.setOnPlayer(player);
    notifyListeners();
  }

  Future<void> play() async {
    await player.resume();
  }

  Future<void> pause() async {
    await player.pause();
  }
}

class TailwindAudioInfoDialog extends StatelessWidget {
  final Tag audioTag;

  const TailwindAudioInfoDialog({super.key, required this.audioTag});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Column(children: [
      Text.rich(TextSpan(children: [
        TextSpan(text: "Placeholder"),
      ]))
    ]));
  }
}
