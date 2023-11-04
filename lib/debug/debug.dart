import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/parts.dart';

typedef DebuggerOverlook = ChangeNotifier;

class DebugTags extends StatelessWidget {
  DebugTags({super.key}) {
    mainPlayer.player.onPlayerStateChanged.listen((event) {
      print("[DBG]: State [${event.name.toUpperCase()}]");
    });
    Duration? lastDuration;
    mainPlayer.player.onPositionChanged.listen((event) {
      lastDuration ??= event;
      if (lastDuration != event) {
        print("[DBG]: Position [$event]");
      }
      lastDuration = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return createSmallTag(
        text: "Armed",
        icon: Icons.bug_report_rounded,
        bg: const Color.fromARGB(255, 77, 65, 252));
  }
}

class DebugOutline extends StatefulWidget {
  const DebugOutline({super.key});

  @override
  State<DebugOutline> createState() => _DebugOutlineState();
}

class _DebugOutlineState extends State<DebugOutline> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
