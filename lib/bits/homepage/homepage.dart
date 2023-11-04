/*------------------------------------------ /
/ import 'package:audiotags/audiotags.dart'; /
/-------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:halcyon_lite/bits/homepage/bottomlayer.dart';
import 'package:halcyon_lite/bits/homepage/toplayer.dart';

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



