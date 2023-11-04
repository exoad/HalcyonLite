import 'package:flutter/material.dart';
import 'package:halcyon_lite/bits/homepage/moosic_playback.dart';
import 'package:halcyon_lite/bits/homepage/moosic_progress.dart';
import 'package:halcyon_lite/bits/homepage/moosic_text_info.dart';
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
                                  const HPlaybackButton(),
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
                              const MoosicProgressControllersState()
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

