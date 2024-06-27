import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/util/theme.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double? height;
  final double? width;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final String? fontFamily;
  final double? fontSize;
  final dynamic padding;
  final dynamic shape;
  final Color? borderColor;
  final dynamic borderRadius;
  final Color? shadowColor;
  final dynamic fontWeight;

  const MyElevatedButton({
    required this.onPressed,
    required this.label,
    this.height,
    this.width,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.fontFamily,
    this.fontSize,
    this.shape,
    this.padding,
    this.borderColor,
    this.borderRadius,
    this.shadowColor,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      height: height ?? 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          border: Border.all(
              color: borderColor ?? ThemeProvider.transparentColor, width: 2.0),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? ThemeProvider.appColor,
              foregroundColor: foregroundColor ?? ThemeProvider.blackColor,
              shadowColor: shadowColor ?? ThemeProvider.blackColor,
              elevation: elevation ?? 3,
              shape: shape ??
                  RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(50),
                  ),
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 10)),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor ?? ThemeProvider.whiteColor,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ??
                  Theme.of(context).textTheme.headlineMedium?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
