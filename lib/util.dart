import 'package:flutter/material.dart';
import 'package:halcyon_lite/laf.dart';

Widget createSimpleButton(IconData icon, Function() onPressed,
    {Color fg = PoprockLaF.bg,
    double? iconSize,
    Color bg = PoprockLaF.primary1}) {
  return Container(
    decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    child: IconButton(
        onPressed: onPressed,
        iconSize: iconSize ?? 32,
        icon: Icon(icon, color: fg)),
  );
}
