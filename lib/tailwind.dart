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
