import 'package:flutter/material.dart';
import 'package:halcyon/halcyon/halcyon.dart';
import 'package:halcyon/util/debug.dart';
import 'package:halcyon/util/io.dart';
import 'package:halcyon/util/logger.dart';
import 'package:halcyon/util/user.dart';

/// This is the main entrypoint into the Halcyon program.
void main() {
  Stopwatch startUpTime = Stopwatch()..start();
  log(LogLevel.LOW, "Starting up...");
  hInitDir();
  hEnsureMasterProperties();
  runApp(const HApp());
  hDebugInitLoggingListeners();
  log(LogLevel.MEDIUM,
      "Halcyon started up in: ${startUpTime.elapsed}");
  startUpTime.stop();
}
