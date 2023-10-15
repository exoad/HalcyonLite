
import 'package:halcyon/util/chronos.dart';

var _logContents = <String>[];

/// [LogLevel] specifies how dangerous a log is and how far it should be prioritized to be shown to
/// the user or the developer.
enum HLogLevel {
  LOW("INFO"),
  MEDIUM("WARN"),
  HIGH("HIGH");

  final String str;
  const HLogLevel(this.str);
}

void hLog(HLogLevel level, content) {
  print("${hFormatLogTimeStamp()} | [${level.str}]\t>\t${content.toString()}");
}