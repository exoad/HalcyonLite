import 'package:flutter/material.dart';
import 'package:halcyon_lite/debug/debug.dart';
import 'package:halcyon_lite/parts/discord/discord.dart';
import 'package:halcyon_lite/parts/tailwind/tailwindstate.dart';
import 'package:halcyon_lite/parts/constants.dart';
import 'package:halcyon_lite/parts/laf.dart';
import 'package:halcyon_lite/parts/util.dart';

Map<String, Widget> appsLoad = <String, Widget>{
  "DiscordRPCLayer": const DiscordRPCTag(),
  "HalcyonLiteArmed": createSmallTag(
      icon: Icons.coffee_rounded, bg: PoprockLaF.primary2),
  "TailwindPipelineStatus": const TailwindStateTag(),
  "TailwindPipelineSeekStatus": const TailwindDurationSeek(),
  if (useDebugging) "HalcyonLiteDebuggerArm": DebugTags()
};
