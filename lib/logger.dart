var _logContents = <String>[];

/// [LogLevel] specifies how dangerous a log is and how far it should be prioritized to be shown to
/// the user or the developer.
enum LogLevel {
  NONE,
  LOW,
  MEDIUM,
  HIGH,
  EXTREME;
}

String _dateFmt() {
  DateTime now = DateTime.now();
  return "${now.month}/{now.hour}:${now.minute}:${now.second}";
}

void log(LogLevel level, content) {}
