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
        highlightColor: transparentColor,
        splashColor: transparentColor,
        onPressed: onPressed,
        iconSize: iconSize ?? 32,
        icon: Icon(icon, color: fg)),
  );
}

extension HColor on Color {
  Color darken(double percentage) {
    assert(percentage >= 0 && percentage <= 1,
        'Percentage should be between 0 and 1');
    int red = (this.red * (1 - percentage)).round();
    int green = (this.green * (1 - percentage)).round();
    int blue = (this.blue * (1 - percentage)).round();
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color lighten(double percentage) {
    assert(percentage >= 0 && percentage <= 1,
        'Percentage should be between 0 and 1');
    int red = (this.red + ((255 - this.red) * percentage)).round();
    int green =
        (this.green + ((255 - this.green) * percentage)).round();
    int blue = (this.blue + ((255 - this.blue) * percentage)).round();
    return Color.fromARGB(alpha, red, green, blue);
  }
}
