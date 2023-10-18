import 'package:flutter/material.dart';
import 'package:halcyon_lite/apps/debug.dart';
import 'package:halcyon_lite/apps/discord.dart';
import 'package:halcyon_lite/apps/tailwindstate.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/util.dart';

Map<String, Widget> appsLoad = <String, Widget>{
  "DiscordRPCLayer": const DiscordRPCTag(),
  "HalcyonLiteArmed": createSmallTag(
      icon: Icons.coffee_rounded, bg: PoprockLaF.primary2),
  "TailwindPipelineStatus": const TailwindStateTag(),
  "TailwindPipelineSeekStatus": const TailwindDurationSeek(),
  if (useDebugging) "HalcyonLiteDebuggerArm": DebugTags()
};
