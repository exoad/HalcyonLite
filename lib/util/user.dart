import 'dart:convert';
import 'dart:io';

import 'package:halcyon/constants.dart';
import 'package:halcyon/halcyon/halcyon_defs.dart';
import 'package:halcyon/util/io.dart';
import 'package:halcyon/util/logger.dart';

/// Defines a few constants for dealing with the desktop environment
enum HSystemOS {
  LINUX,
  OSX,
  WIN32,
  UNKNOWN;
}

/// Returns a [HSystemOS] constant representing the current user's platform
HSystemOS get() => Platform.isLinux
    ? HSystemOS.LINUX
    : Platform.isWindows
        ? HSystemOS.WIN32
        : Platform.isMacOS
            ? HSystemOS.OSX
            : HSystemOS.UNKNOWN;

void hEnsureMasterProperties() async {
  File f = File("$HFOLDER_NAME/config/$HMASTERCONF_NAME");
  if (await f.exists()) {
    // Here we read the contents of the file and push it back to the Halcyon_Defs and Tailwind Defs respectively.
    dynamic config = json.decode(await f.readAsString());
    AppConstants.hConf = HConfig.fromJson(config);
    log(LogLevel.MEDIUM, "Load [HConfig] -> [FileSys]");
  } else {
    // Here we assign the default values to the respective Halcyon and Tailwind defs
    AppConstants.hConf = HConfig.fromJson({});

    // Create the file
    f.create(recursive: true);
    f.writeAsString(hPrettifyJSON(AppConstants.hConf.toJson()));

    log(LogLevel.HIGH, "Loading [HConfig] -> [Defaults]");
  }

  log(LogLevel.MEDIUM, "Loaded [HConfig] with [${AppConstants.hConf.toJson().length}] properties");
}
