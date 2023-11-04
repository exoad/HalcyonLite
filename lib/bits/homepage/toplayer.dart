import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/apps.dart';
import 'package:halcyon_lite/parts/parts.dart';

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
                Flexible(
                    child: GestureDetector(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return HDialog(
                                    title: "Album Art",
                                    content: Image.memory(mainPlayer
                                        .tag!.pictures[0].bytes),
                                    actions: [
                                      TextButton(
                                          style: const ButtonStyle(
                                              overlayColor:
                                                  MaterialStatePropertyAll(
                                                      transparentColor),
                                              shadowColor:
                                                  MaterialStatePropertyAll(
                                                      transparentColor),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      PoprockLaF
                                                          .primary3),
                                              foregroundColor:
                                                  MaterialStatePropertyAll(
                                                      PoprockLaF.bg)),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          child: const Text("Close"))
                                    ]);
                              });
                        },
                        child: const AlbumArt())),
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
                                  HToggleBtn(
                                      toggleOffLook: (
                                        bg: transparentColor,
                                        fg: PoprockLaF.primary1
                                      ),
                                      toggleOnLook: (
                                        bg: PoprockLaF.primary1,
                                        fg: Colors.black
                                      ),
                                      icon: Icons.shuffle_rounded,
                                      iconSize: 22,
                                      onTapListener: (e) {},
                                      padding: 5),
                                  const SizedBox(
                                      width: HalcyonLLaf
                                          .playbackControlsButtonSpacing),
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
                                  const SizedBox(
                                      width: HalcyonLLaf
                                          .playbackControlsButtonSpacing),
                                  HToggleBtn(
                                      toggleOffLook: (
                                        bg: transparentColor,
                                        fg: PoprockLaF.primary1
                                      ),
                                      toggleOnLook: (
                                        bg: PoprockLaF.primary1,
                                        fg: Colors.black
                                      ),
                                      icon: Icons.loop_rounded,
                                      iconSize: 22,
                                      onTapListener: (e) {},
                                      padding: 8),
                                ],
                              ),
                              const MoosicProgress(),
                              _MoosicProgressControllersState()
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
                    /*---------------------------------------------------------------------------- /
                    / await showDialog(                                                            /
                    /     context: context,                                                        /
                    /     builder: (context) {                                                     /
                    /       Tag tag = mainPlayer.tag!;                                             /
                    /       return HDialog(                                                        /
                    /           title: "",                                                         /
                    /           content:                                                           /
                    /               CustomScrollView(slivers: <Widget>[                            /
                    /             SliverList(delegate:                                             /
                    /                 SliverChildBuilderDelegate(                                  /
                    /                     (context, index) {                                       /
                    /               return Text.rich(                                              /
                    /                 TextSpan(children: [                                         /
                    /                   const TextSpan(                                            /
                    /                       text: "Title: ",                                       /
                    /                       style: TextStyle(                                      /
                    /                           fontWeight: HalcyonLLaf                            /
                    /                               .displayTrackInformationTagHeaderFontWeight)), /
                    /                   TextSpan(                                                  /
                    /                       text: "${tag.title}\n"),                               /
                    /                   const TextSpan(                                            /
                    /                       text: "Track Artist: ",                                /
                    /                       style: TextStyle(                                      /
                    /                           fontWeight: HalcyonLLaf                            /
                    /                               .displayTrackInformationTagHeaderFontWeight)), /
                    /                                                                              /
                    /                 ]),                                                          /
                    /                 style: const TextStyle(                                      /
                    /                     color: PoprockLaF.primary1),                             /
                    /               );                                                             /
                    /             }))                                                              /
                    /           ]));                                                               /
                    /     });                                                                      /
                    /-----------------------------------------------------------------------------*/
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
                      fontSize: 12, fontWeight: FontWeight.w700)),
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

class _MoosicProgressControllersState extends StatelessWidget {
  static Widget _createControllerButton(
      {required IconData icon,
      Color bg = PoprockLaF.primary3,
      required void Function() onPressed}) {
    return IconButton(
        onPressed: onPressed, icon: Icon(icon, color: bg, size: 24));
  }

  static Future<int> _calculateSeekTo(bool subtract) async {
    int total = (await mainPlayer.player.getDuration())!.inSeconds;
    int posRn =
        (await mainPlayer.player.getCurrentPosition())!.inSeconds;
    int result = subtract
        ? posRn - audioSeekAmountAutoSeconds
        : posRn + audioSeekAmountAutoSeconds;
    return clampFx(value: result, lower: 0, upper: total) as int;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createControllerButton(
              icon: Icons.chevron_left_rounded,
              onPressed: () async {
                mainPlayer.player.seek(
                    Duration(seconds: await _calculateSeekTo(true)));
              }),
          _createControllerButton(
              icon: Icons.square_rounded,
              onPressed: () {
                mainPlayer.player.seek(Duration.zero);
                mainPlayer.player.pause();
              }),
          _createControllerButton(
              icon: Icons.chevron_right_rounded,
              onPressed: () async {
                mainPlayer.player.seek(
                    Duration(seconds: await _calculateSeekTo(false)));
              }),
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
  Duration currentPosition = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onPositionChanged.listen((event) {
      setState(() {
        mainPlayer.player.getDuration().then((value) {
          _sliderPercent =
              event.inMilliseconds / value!.inMilliseconds;
          currentPosition = event;
          duration = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createSmallTag(
            text: formatDuration(currentPosition),
            bg: PoprockLaF.primary2),
        Expanded(
          child: Slider(
              value: _sliderPercent,
              onChanged: (percent) {
                setState(() {
                  _sliderPercent = percent;
                  mainPlayer.player.getDuration().then((value) {
                    mainPlayer.player.seek(Duration(
                        milliseconds:
                            (percent * value!.inMilliseconds)
                                .toInt()));
                  });
                });
              }),
        ),
        createSmallTag(
            text: formatDuration(duration), bg: PoprockLaF.primary2)
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
                padding: const EdgeInsets.all(46),
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

  static MasterTagsState? getCurrState() =>
      masterTagsKey.currentState;
}

class MasterTagsState extends State<MasterTags> {
  final Map<String, Widget> tags = <String, Widget>{};

  @override
  void initState() {
    super.initState();
    appsLoad.forEach((key, value) {
      addTag(key, value);
    });
  }

  void addTag(String name, Widget tag) {
    setState(() => tags[name] = tag);
  }

  void removeTag(String name) {
    setState(() => tags.remove(name));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: tags.values.toList(),
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

  @override
  void initState() {
    super.initState();
    mainPlayer.player.onPlayerStateChanged.listen((playerState) {
      setState(() {
        isPlaying = playerState == PlayerState.playing;
      });
    });
  }

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
