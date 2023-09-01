import 'package:halcyon/tailwind/tailwind.dart';
import 'package:halcyon/util/logger.dart';

void hDebugInitLoggingListeners() {
  tailwind.expose().eventStream.listen((event) => hLog(
      HLogLevel.MEDIUM,
      "TailwindEvent[${event.eventType}] | Dur: ${event.duration} | Pos: ${event.position}"));
}