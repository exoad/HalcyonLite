import 'package:flutter/material.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/tailwind.dart';
import 'package:halcyon_lite/util.dart';

class HalcyonHome extends StatelessWidget {
  const HalcyonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Flex(direction: Axis.horizontal, children: [
          Flexible(
              child: Center(
            child: Image(
                image:
                    HassetContract.assetImages["defaultAlbumArt"]!),
          )),
          Flexible(
            flex: 1,
            child: Flex(
              direction: Axis.vertical,
              children: [
                const Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      "Placeholder text",
                      style: TextStyle(color: PoprockLaF.primary1),
                      textAlign: TextAlign.center,
                    ),
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
                          Icons.keyboard_double_arrow_left_rounded,
                          () {},
                          iconSize: 24,
                        ),
                        const SizedBox(width: 25),
                        _HPlaybackButton(),
                        const SizedBox(width: 25),
                        createSimpleButton(
                          Icons.keyboard_double_arrow_right_rounded,
                          () {},
                          iconSize: 24,
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
  Widget build(BuildContext context) {
    return createSimpleButton(
        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        () => setState(() {
              isPlaying = !isPlaying;
              if (isPlaying) {
                mainPlayer.resume();
              } else {
                mainPlayer.pause();
              }
            }));
  }
}
