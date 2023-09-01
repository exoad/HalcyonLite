import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:halcyon/halcyon/halcyon.dart';
import 'package:halcyon/tailwind/tailwind.dart';
import 'package:halcyon/util/debug.dart';
import 'package:halcyon/util/io.dart';
import 'package:halcyon/util/logger.dart';
import 'package:halcyon/util/user.dart';

/// Defines the manifest time at which the program was started at.
late final DateTime HSTARTUP_TIME;

/// This is the main entrypoint into the Halcyon program.
void main() {
  HSTARTUP_TIME = DateTime.now();
  Stopwatch startUpTime = Stopwatch()..start();
  hLog(HLogLevel.LOW, "Starting up...");
  hInitDir();
  hEnsureMasterProperties();
  runApp(const HApp());
  hDebugInitLoggingListeners();
  hLog(HLogLevel.MEDIUM,
      "Halcyon started up in: ${startUpTime.elapsed}");
  startUpTime.stop();

  // following for debug purposes!!!

  tailwind.setSource(AssetSource("test.mp3"));
}
