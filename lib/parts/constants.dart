import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

num clampFx(
        {required num value,
        required num lower,
        required num upper}) =>
    value < lower
        ? lower
        : value > upper
            ? upper
            : value;

const bool useDebugging = true;

const int audioSeekAmountAutoSeconds = 5;

enum AssetType { image, audio, video, font, other }

Map<String, ({String path, AssetType type})> assetPaths = {
  "darbyRelive": (
    path: "moosic/darby-relive.mp3",
    type: AssetType.audio
  ),
  "rimworldOST": (
    path: "moosic/rimworldost.mp3",
    type: AssetType.audio
  ),
  "cloudSurfing": (
    path: "moosic/cloud-surfing.mp3",
    type: AssetType.audio
  ),
  "defaultAlbumArt": (
    path: "assets/img/DefaultAA.png",
    type: AssetType.image
  ),
};

AssetsContract HassetContract = AssetsContract();

class AssetsContract {
  final Map<String, AssetImage> assetImages = {};
  final Map<String, AssetSource> assetAudio = {};

  void load() {
    assetPaths.forEach((key, value) {
      if (value.type == AssetType.image)
        assetImages[key] = AssetImage(value.path);
      else if (value.type == AssetType.audio)
        assetAudio[key] = AssetSource(value.path);
    });
  }
}
