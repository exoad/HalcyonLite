import 'dart:async';

import 'package:discord_rpc/discord_rpc_native.dart';
import 'package:discord_rpc/model/discord_presence.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/parts.dart';

const String DISCORDPRC_APPLICATION_ID = "1163235279147126886";

late DiscordRPC _rpc;
bool discordRPCOnline = false;

StreamController<bool> _discordRPCStateController =
    StreamController<bool>();
Stream<bool> get discordRPCStateStream =>
    _discordRPCStateController.stream;

void initDiscordRPC() {
  DiscordRPC.initialize();
  _rpc = DiscordRPC(applicationId: DISCORDPRC_APPLICATION_ID);
  mainPlayer.tagStream.listen((event) {
    if (discordRPCOnline) {
      updateDiscordRPC(
        state: "Halcyon",
        details: mainPlayer.tag?.title ?? "Unknown",
        largeImageKey: "main",
        largeImageDetail: "Halcyon lite",
      );
    }
  });
}

void startDiscordRPC() {
  _rpc.start(autoRegister: true);
  discordRPCOnline = true;
  _discordRPCStateController.sink.add(discordRPCOnline);
}

void stopDiscordRPC() {
  _rpc.shutDown();
  discordRPCOnline = false;
  _discordRPCStateController.sink.add(discordRPCOnline);
}

void updateDiscordRPC(
    {required String state,
    required String details,
    String? largeImageKey,
    String? largeImageDetail,
    String? smallImageKey,
    String? smallImageDetail}) {
  _rpc.updatePresence(DiscordPresence(
    state: state,
    details: details,
    largeImageKey: largeImageKey,
    largeImageText: largeImageDetail,
    smallImageKey: smallImageKey,
    smallImageText: smallImageDetail,
  ));
}

void clearDiscordRPC() {
  _rpc.clearPresence();
}

class DiscordRPCTag extends StatefulWidget {
  const DiscordRPCTag({super.key});

  @override
  State<DiscordRPCTag> createState() => _DiscordRPCTagState();
}

class _DiscordRPCTagState extends State<DiscordRPCTag> {
  @override
  void initState() {
    super.initState();
    discordRPCStateStream.listen((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (discordRPCOnline)
          stopDiscordRPC();
        else
          startDiscordRPC();
      },
      child: createSmallTag(
        icon: Icons.discord_rounded,
        text: "RPC ${discordRPCOnline ? "On" : "Off"}",
      ),
    );
  }
}
