import 'dart:convert';
import 'dart:io';

import 'package:halcyon/halcyon/halcyon_defs.dart';

typedef HFileCreationConf = ({
  String content,
  FileMode mode,
  Encoding encoding,
  bool autoFlush
});

/// Initializes the Halcyon working folder for things like configuration, caching, and more.
///
/// Should be mainly called **once** at the start of the program
void hInitDir({bool asyncCreate = false}) {
  Directory("./$HFOLDER_NAME").create();
  if (asyncCreate) {
    for (var x in HFOLDER_SUBFOLDERS) {
      Directory("./$HFOLDER_NAME/$x").create();
    }
  } else {
    for (var x in HFOLDER_SUBFOLDERS) {
      Directory("./$HFOLDER_NAME/$x").createSync();
    }
  }
}

/// Creates the file if it doesn't already exist
///
/// Returns the file object
Future<File> hCreateFileIfNotExist(String fileDir) async {
  File f = File(fileDir);
  if (!await f.exists()) {
    f.create(recursive: true);
  }
  return f;
}

/// Writes to a file and checks if the file exists.
Future<File> hCreateFileIfNotExistAndWrite(
    String fileDir, HFileCreationConf conf) async {
  File e = await hCreateFileIfNotExist(fileDir);
  return e.writeAsString(conf.content,
      mode: conf.mode,
      encoding: conf.encoding,
      flush: conf.autoFlush);
}

const JsonEncoder _jsonEncoder =
    JsonEncoder.withIndent("                ");

String hPrettifyJSON(dynamic uglyJson) =>
    _jsonEncoder.convert(uglyJson);