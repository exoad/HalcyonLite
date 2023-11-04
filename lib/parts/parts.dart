export 'tailwind/tailwind.dart';
export 'laf.dart';
export 'constants.dart';
import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/laf.dart';


Widget createSimpleButton(IconData icon, Function() onPressed,
    {Color fg = PoprockLaF.bg,
    double? iconSize,
    Color bg = PoprockLaF.primary1}) {
  return Container(
    decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(
            Radius.circular(HalcyonLLaf.arcRadius))),
    child: IconButton(
        highlightColor: transparentColor,
        splashColor: transparentColor,
        onPressed: onPressed,
        iconSize: iconSize ?? HalcyonLLaf.bigButtonIconSize,
        icon: Icon(
          icon,
          color: fg,
        )),
  );
}

String formatDuration(Duration duration) {
  String hoursString =
      (duration.inHours > 0) ? '${duration.inHours}:' : '';
  String minutesString = (duration.inMinutes.remainder(60) < 10)
      ? '0${duration.inMinutes.remainder(60)}'
      : '${duration.inMinutes.remainder(60)}';
  String secondsString = (duration.inSeconds.remainder(60) < 10)
      ? '0${duration.inSeconds.remainder(60)}'
      : '${duration.inSeconds.remainder(60)}';

  return '$hoursString$minutesString:$secondsString';
}

Widget createSmallTag(
    {IconData? icon,
    String? text,
    double gap = 2,
    Color fg = PoprockLaF.bg,
    Color bg = PoprockLaF.primary1,
    TextStyle textStyle =
        const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
    double iconSize = 12}) {
  assert(icon != null || text != null,
      "Either icon or text must be non-null in a small attribute tag (icon: $icon, text: $text)");
  return Padding(
    padding: const EdgeInsets.all(4),
    child: Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(
          Radius.circular(HalcyonLLaf.tagArcRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: fg, size: iconSize),
              if (icon != null && text != null) SizedBox(width: gap),
              if (text != null)
                Text(
                  text,
                  style: textStyle.copyWith(color: fg),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

typedef EntireColorBundle = ({Color bg, Color fg});

class HToggleBtn extends StatefulWidget {
  final EntireColorBundle toggleOnLook;
  final EntireColorBundle toggleOffLook;
  final IconData icon;
  final double iconSize;
  final void Function(bool) onTapListener;
  final double padding;
  const HToggleBtn(
      {super.key,
      required this.toggleOffLook,
      required this.toggleOnLook,
      required this.icon,
      required this.iconSize,
      required this.onTapListener,
      required this.padding});

  @override
  State<HToggleBtn> createState() => _HToggleBtnState();
}

class _HToggleBtnState extends State<HToggleBtn> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
          color: _toggled
              ? widget.toggleOnLook.bg
              : widget.toggleOffLook.bg,
          borderRadius: const BorderRadius.all(
              Radius.circular(HalcyonLLaf.arcRadius))),
      child: IconButton(
          onPressed: () {
            setState(() => _toggled = !_toggled);
            widget.onTapListener.call(_toggled);
          },
          icon: Icon(widget.icon,
              size: widget.iconSize,
              color: _toggled
                  ? widget.toggleOnLook.fg
                  : widget.toggleOffLook.fg)),
    );
  }
}

class HDialog extends StatelessWidget {
  const HDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions,
    this.titleStyle,
  }) : super(key: key);

  final String title;
  final Widget content;
  final List<Widget>? actions;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: titleStyle),
      content: content,
      actions: actions,
    );
  }
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
