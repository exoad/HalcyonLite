import 'package:file_picker/file_picker.dart';

/// **Represents a bundle of information for the file picker to utilize**
///
/// [`dialogTitle`] - Represents the title to show for the window
///
/// [`initialDir`] - The starting directory where the user should be directed to
///
/// [`multiple`] - Whether to allow the user to select multiple files
///
/// [`lockParentWindow`] - Makes the window that this file picker was initated from (usually Main) to be unusable (disabled)
///
/// [`allowedExtensions`] - What file extensions are allowed.
typedef HFilePickConf = ({String? dialogTitle, String? initialDir, bool multiple, bool lockParentWindow, List<String> allowedExtensions});

/// A basis for a simple representation of file information. This is a separate macro of [PlatformFile].
///
/// [`path`] - The absolute path to this file
///
/// [`type`] - The file extension (thing after the last ".")
///
/// [`size`] - The size in bytes of the file (if cannot be resolved, this will return `0`)
typedef HFileInformativeRes = ({String path, String type, int size});

Future<FilePickerResult?> _acquire_res(HFilePickConf config) async => await FilePicker.platform.pickFiles(
    allowMultiple: config.multiple,
    dialogTitle: config.dialogTitle,
    initialDirectory: config.initialDir,
    type: FileType.any,
    lockParentWindow: config.lockParentWindow,
    allowedExtensions: config.allowedExtensions);

Future<List<HFileInformativeRes>> launch_selectF_custom(HFilePickConf config) async {
  FilePickerResult? res = await _acquire_res(config);
  List<HFileInformativeRes> files = [];
  if (res != null) {
    for (var element in res.files) {
      if (element.path != null) {
        files.add((path: element.path!, type: element.extension ?? '', size: element.size));
      }
    }
  }
  return files;
}

Future<List<PlatformFile>> launch_selectF(HFilePickConf config) async {
  FilePickerResult? res = await _acquire_res(config);
  List<PlatformFile> files = [];
  if (res != null) {
    files = res.files;
  }
  return files;
}
