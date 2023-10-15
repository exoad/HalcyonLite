import 'package:flutter/material.dart';
import 'package:halcyon_lite/constants.dart';
import 'package:halcyon_lite/laf.dart';
import 'package:halcyon_lite/util.dart';

class HalcyonHome extends StatelessWidget {
  const HalcyonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Flex(direction: Axis.horizontal, children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                    child: Image(
                        image: HassetContract
                            .assets["defaultAlbumArt"])),
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
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createSimpleButton(
                            Icons.keyboard_double_arrow_left_rounded,
                            () {},
                            fg: PoprockLaF.primary1,
                            bg: transparentColor),
                        const SizedBox(width: 25),
                        createSimpleButton(
                            Icons.play_arrow_rounded, () {}),
                        const SizedBox(width: 25),
                        createSimpleButton(
                            Icons.keyboard_double_arrow_right_rounded,
                            () {},
                            fg: PoprockLaF.primary1,
                            bg: transparentColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
