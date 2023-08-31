import 'dart:io';

import 'package:halcyon/halcyon/halcyon_defs.dart';

/// Initializes the Halcyon working folder for things like configuration, caching, and more.
///
/// Should be mainly called **once** at the start of the program
void hInitDir() {
  Directory("./$HFOLDER_NAME").create();

  for (var x in HFOLDER_SUBFOLDERS) {
    Directory("./$HFOLDER_NAME/$x").create();
  }
}
