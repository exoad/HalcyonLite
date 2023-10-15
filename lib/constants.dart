import 'package:flutter/material.dart';

enum AssetType { image, audio, video, font, other }

String _asset(String path) => "assets/$path";

Map<String, ({String path, AssetType type})> assetPaths = {
  "darbyRelive": (
    path: _asset("moosic/darby-relive.mp3"),
    type: AssetType.audio
  ),
  "cloudSurfing": (
    path: _asset("moosic/cloud-surfing.mp3"),
    type: AssetType.audio
  ),
  "defaultAlbumArt": (
    path: _asset("icons/DefaultAlbumArt.png"),
    type: AssetType.image
  ),
};

AssetsContract HassetContract = AssetsContract();

class AssetsContract {
  late final Map<String, dynamic> assets = {};

  void load() {
    assetPaths.forEach((key, value) {
      if (value.type == AssetType.image)
        assets[key] = AssetImage(value.path);
    });
  }
}
