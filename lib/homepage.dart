import 'package:flutter/material.dart';
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
      body: TopLayerHome(),
    );
  }
}

class TopLayerHome extends StatelessWidget {
  const TopLayerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            createSimpleButton(
                              Icons
                                  .keyboard_double_arrow_left_rounded,
                              () {},
                              iconSize:
                                  HalcyonLLaf.smallButtonIconSize,
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
                              iconSize:
                                  HalcyonLLaf.smallButtonIconSize,
                            ),
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
    return Text(
      mainPlayer.tag?.title ?? "No Song Playing",
      style: const TextStyle(color: PoprockLaF.primary1),
      textAlign: TextAlign.center,
    );
  }
}

class AlbumArt extends StatelessWidget {
  const AlbumArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
          image: HassetContract.assetImages["defaultAlbumArt"]!),
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
}

class MasterTagsState extends State<MasterTags> {
  final Map<String, Widget> _tags = <String, Widget>{};

  void addTag(String name, Widget tag) =>
      setState(() => _tags[name] = tag);

  void removeTag(String name) => setState(() => _tags.remove(name));

  @override
  Widget build(BuildContext context) {
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
