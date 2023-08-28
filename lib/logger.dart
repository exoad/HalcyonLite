import "package:halcyon/util/chronos.dart" as chronos;

var _logContents = <String>[];

/// [LogLevel] specifies how dangerous a log is and how far it should be prioritized to be shown to
/// the user or the developer.
enum LogLevel {
  LOW("LO"),
  MEDIUM("ME"),
  HIGH("HI"),
  EXTREME("EX");

  final String str;
  const LogLevel(this.str);
}

String _dateFmt() {
  DateTime now = DateTime.now();
  return "${chronos.monthName(now.month)}/${now.day}/${now.year} | {now.hour}:${now.minute}:${now.second}";
}

void log(LogLevel level, content) {
  print("${_dateFmt()} | [${level.str}]\t>\t${content.toString()}");
}