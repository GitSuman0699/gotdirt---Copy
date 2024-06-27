import 'package:flutter/material.dart';
import 'package:gotdirt/app/util/theme.dart';

class MySlider extends StatelessWidget {
  final dynamic controllerValue;
  final dynamic onChanged;
  final double min;
  final double max;

  const MySlider({
    super.key,
    this.controllerValue,
    this.onChanged,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        // tickMarkShape: ,
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: max),
        inactiveTickMarkColor: ThemeProvider.appColor.withOpacity(0.6),
        activeTrackColor: ThemeProvider.greyColor.withOpacity(0.6),
        inactiveTrackColor: ThemeProvider.greyColor.withOpacity(0.6),
        trackShape: CustomTrackShape(),
        trackHeight: 10.0,
        thumbColor: ThemeProvider.appColor,
        overlayColor: ThemeProvider.greyColor.withOpacity(0.6),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10.0,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 14.0,
        ),
      ),
      child: Slider(
        min: min,
        max: max,
        value: controllerValue,
        onChanged: onChanged,
        divisions: 2,
      ),
    );
  }
}

class MyRangeSlider extends StatelessWidget {
  final dynamic controllerValue;
  final dynamic onChanged;
  final double min;
  final double max;

  const MyRangeSlider({
    super.key,
    this.controllerValue,
    this.onChanged,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: ThemeProvider.chatRightSide,
        inactiveTrackColor: ThemeProvider.chatRightSide.withOpacity(0.6),
        trackShape: CustomTrackShape(),
        trackHeight: 17.0,
        thumbColor: ThemeProvider.chatRightSide,
        overlayColor: ThemeProvider.transparentColor,
        disabledThumbColor: ThemeProvider.chatRightSide,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 9.0,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 28.0,
        ),
      ),
      child: Slider(
        min: min,
        max: max,
        value: controllerValue,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
