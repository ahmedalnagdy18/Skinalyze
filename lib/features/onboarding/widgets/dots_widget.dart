import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget(
      {super.key,
      required this.dotsCount,
      required this.position,
      this.sized,
      this.activeSizeH,
      this.activeSizeW,
      this.activeColor});
  final int dotsCount;
  final double position;
  final double? sized;
  final double? activeSizeH;
  final double? activeSizeW;
  final Color? activeColor;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        size: Size.square(sized ?? 8),
        activeSize: Size(activeSizeW ?? 24, activeSizeH ?? 12),
        activeShape: CircleBorder(
          side: const BorderSide(color: Colors.white, style: BorderStyle.solid),
        ),
        activeColor: activeColor ?? Colors.white,
        color: Colors.white24,
        spacing: const EdgeInsets.all(3),
        shape: CircleBorder(
          side:
              const BorderSide(color: Colors.white24, style: BorderStyle.solid),
        ),
      ),
    );
  }
}
