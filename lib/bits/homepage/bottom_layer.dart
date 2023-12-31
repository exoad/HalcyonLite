import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/constants.dart';
import 'package:halcyon_lite/parts/tailwind/tailwind.dart';

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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent,
                Color.fromARGB(120, 0, 0, 0),
                Color.fromARGB(150, 0, 0, 0),
              ],
              stops: [0, 0.55, 0.65],
            ),
          ),
        ),
      ],
    );
  }
}
