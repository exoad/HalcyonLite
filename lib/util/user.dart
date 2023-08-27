import 'dart:io';

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
