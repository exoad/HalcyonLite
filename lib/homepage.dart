import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:halcyon_lite/apps/apps.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/tailwind.dart';
import 'package:halcyon_lite/util.dart';

class HalcyonHome extends StatelessWidget {
  const HalcyonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        BottomLayerHome(),
        TopLayerHome(),
      ]),
    );
  }
}

class BottomLayerHome extends StatefulWidget {
  const BottomLayerHome({
    super.key,
  });

  @override
  State<BottomLayerHome> createState() => _BottomLayerHomeState();
}

class _BottomLayerHomeState extends State<BottomLayerHome> {
  @override
  void initState() {
    super.initState();
    mainPlayer.tagStream.listen((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: mainPlayer.tag != null
              ? Image.memory(
                  mainPlayer.tag!.pictures[0].bytes,
                  fit: BoxFit.cover,
                  scale: MediaQuery.of(context).devicePixelRatio,
                )
              : Image(
                  fit: BoxFit.cover,
                  image:
                      HassetContract.assetImages["defaultAlbumArt"]!,
                ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.transparent, Colors.black],
              stops: [0.2, 0.75],
            ),
          ),
        ),
      ],
    );
  }
}

class TopLayerHome extends StatelessWidget {
  const TopLayerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(100, 0, 0, 0),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
              flex: 0,
              child: MasterTags(key: MasterTags.masterTagsKey)),
          Flexible(
            flex: 1,
            child: Center(
              child: Flex(direction: Axis.horizontal, children: [
                const Flexible(child: AlbumArt()),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Center(
                          child: MoosicTextInfo(),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  createSimpleButton(
                                    Icons
                                        .keyboard_double_arrow_left_rounded,
                                    () {},
                                    iconSize: HalcyonLLaf
                                        .smallButtonIconSize,
                                  ),
                                  const SizedBox(
                                      width: HalcyonLLaf
                                          .playbackControlsButtonSpacing),
                                  _HPlaybackButton(),
                                  const SizedBox(
                                      width: HalcyonLLaf
                                          .playbackControlsButtonSpacing),
                                  createSimpleButton(
                                    Icons
                                        .keyboard_double_arrow_right_rounded,
                                    () {},
                                    iconSize: HalcyonLLaf
                                        .smallButtonIconSize,
                                  ),
                                ],
                              ),
                              const MoosicProgress()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MoosicTextInfo extends StatefulWidget {
  const MoosicTextInfo({
    super.key,
  });

  @override
  State<MoosicTextInfo> createState() => _MoosicTextInfoState();
}

class _MoosicTextInfoState extends State<MoosicTextInfo> {
  @override
  void initState() {
    super.initState();
    mainPlayer.tagStream.listen((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                  // todo: finish implementing this widget for an information dialog
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return TailwindAudioInfoDialog(
                              audioTag: mainPlayer.tag!);
                        });
                  },
                  child: createSmallTag(
                      icon: Icons.info_outline_rounded,
                      iconSize: 16)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  mainPlayer.tag?.title ?? "Unknown",
                  style: const TextStyle(
                      fontSize: HalcyonLLaf.primaryMoosicInfoFontSize,
                      color: PoprockLaF.primary1,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(children: [
            createSmallTag(
                text: mainPlayer.tag?.trackArtist ?? "Unknown",
                bg: PoprockLaF.primary2,
                textStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
            if ((mainPlayer.tag?.album ?? "Unknown") != "Unknown")
              createSmallTag(
                  text: mainPlayer.tag?.album ?? "Unknown",
                  bg: PoprockLaF.primary2,
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800)),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            createSmallTag(
                text: mainPlayer
                    .getSource()
                    .split(".")[
                        mainPlayer.getSource().split(".").length - 1]
                    .toUpperCase(),
                bg: PoprockLaF.primary3),
            createSmallTag(
                text: Duration(seconds: mainPlayer.tag?.duration ?? 0)
                    .toString()
                    .split(".")[0],
                bg: PoprockLaF.primary3),
            createSmallTag(
              text: mainPlayer.tag?.year.toString() ?? "Unknown",
              bg: PoprockLaF.primary3,
            )
          ])
        ]);
  }
}

class MoosicProgress extends StatefulWidget {
  const MoosicProgress({super.key});

  @override
  State<MoosicProgress> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<MoosicProgress> {
  double _sliderPercent = 0.0;

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onPositionChanged.listen((event) {
      setState(() {
        mainPlayer.player.getDuration().then((value) =>
            _sliderPercent =
                event.inMilliseconds / value!.inMilliseconds);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          createSmallTag( text:  ""),


        Expanded(
          child: Slider(
              value: _sliderPercent,
              onChanged: (percent) {
                setState(() {
                  _sliderPercent = percent;
                  mainPlayer.player.getDuration().then((value) {
                    mainPlayer.player
                        .seek(Duration(
                            milliseconds:
                                (percent * value!.inMilliseconds)
                                    .toInt()))
                        .then((value) => print(
                            "Progress Bar seeked to ${percent * 100}%"));
                  });
                });
              }),
        ),
      ],
    );
  }
}

class AlbumArt extends StatefulWidget {
  const AlbumArt({
    super.key,
  });

  @override
  State<AlbumArt> createState() => _AlbumArtState();
}

class _AlbumArtState extends State<AlbumArt> {
  @override
  void initState() {
    super.initState();
    mainPlayer.tagStream.listen((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: mainPlayer.tag != null
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(HalcyonLLaf.arcRadius)),
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.memory(
                          mainPlayer.tag!.pictures[0].bytes,
                          fit: BoxFit.cover)),
                ),
              )
            : Image(
                image:
                    HassetContract.assetImages["defaultAlbumArt"]!),
      ),
    );
  }
}

class MasterTags extends StatefulWidget {
  const MasterTags({Key? key}) : super(key: key);

  @override
  State<MasterTags> createState() => MasterTagsState();

  static final GlobalKey<MasterTagsState> masterTagsKey =
      GlobalKey<MasterTagsState>();

  static void addTag(String name, Widget tag) =>
      masterTagsKey.currentState?.addTag(name, tag);

  static void removeTag(String name) =>
      masterTagsKey.currentState?.removeTag(name);

  static void refresh() => masterTagsKey.currentState?.refresh();
}

class MasterTagsState extends State<MasterTags> {
  final Map<String, Widget> _tags = <String, Widget>{};

  @override
  void initState() {
    super.initState();
    appsLoad.forEach((key, value) {
      addTag(key, value);
    });
  }

  void addTag(String name, Widget tag) =>
      setState(() => _tags[name] = tag);

  void removeTag(String name) => setState(() => _tags.remove(name));

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    print(_tags.keys.toList());
    return SizedBox(
      height: 24,
      child: Row(
        children: _tags.values.toList(),
      ),
    );
  }
}

class _HPlaybackButton extends StatefulWidget {
  @override
  State<_HPlaybackButton> createState() => _HPlaybackButtonState();
}

class _HPlaybackButtonState extends State<_HPlaybackButton> {
  bool isPlaying = false;

  void _togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        mainPlayer.play();
      } else {
        mainPlayer.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: isPlaying
                  ? PoprockLaF.primary2
                  : PoprockLaF.primary1,
              borderRadius: const BorderRadius.all(
                  Radius.circular(HalcyonLLaf.arcRadius))),
          child: Center(
              child: IconButton(
            splashColor: transparentColor,
            highlightColor: transparentColor,
            onPressed: _togglePlay,
            icon: Icon(
                isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: PoprockLaF.bg),
            iconSize: HalcyonLLaf.bigButtonIconSize,
          ))),
    );
  }
}
