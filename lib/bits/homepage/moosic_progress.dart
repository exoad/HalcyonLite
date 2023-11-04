import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/parts.dart';

class MoosicProgressControllersState extends StatelessWidget {
  const MoosicProgressControllersState({super.key});

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
