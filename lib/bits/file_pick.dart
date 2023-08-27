import 'package:file_picker/file_picker.dart';

/// Represents a bundle of information for the file picker to utilize
/// [dialogTitle] - Represents the title to show for the window
/// [initialDir] - The starting directory where the user should be directed to
typedef HFilePickConf = ({String? dialogTitle, String? initialDir, bool multiple, List<String> allowedExtensions});

typedef HFileInformativeRes = ({String path, String type, int size});

Future<List<HFileInformativeRes>> launch_select_custom(HFilePickConf config) async {
  FilePickerResult? res = await FilePicker.platform.pickFiles(
      allowMultiple: config.multiple,
      dialogTitle: config.dialogTitle,
      initialDirectory: config.initialDir,
      type: FileType.any,
      allowedExtensions: config.allowedExtensions);
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
