import 'package:flutter/material.dart';

const typeTheme = Typography.whiteMountainView;

class ThemeProvider {
  static const appColor = Color(0xFF512904);
  static const appColorLight = Color.fromARGB(255, 232, 218, 205);
  static const secondaryAppColor = Color(0xFF9C9C9C);
  static const redColor = Color(0xFFC80000);
  static const greenColor = Color(0xFF12B70E);
  static const whiteColor = Colors.white;
  static const blackColor = Color(0xFF000000);
  static const greyColor = Colors.grey;
  static const darkGreyColor = Color(0xFF828282);
  static const lightGrey = Color(0xFFF1F0EC);
  static const shadowGrey = Color.fromARGB(238, 223, 223, 223);
  static const transparentColor = Color.fromARGB(0, 158, 158, 158);
  static const chatRightSide = Color(0xFF9C9888);
  static const popupWhite = Color(0xFFEEEBF6);
}

TextTheme txtTheme = Typography.whiteMountainView.copyWith(
  bodyLarge: typeTheme.bodyLarge?.copyWith(fontSize: 16),
  bodyMedium: typeTheme.bodyMedium?.copyWith(fontSize: 14),
  displayLarge: typeTheme.displayLarge?.copyWith(fontSize: 32),
  displayMedium: typeTheme.displayMedium?.copyWith(fontSize: 28),
  displaySmall: typeTheme.displaySmall?.copyWith(fontSize: 24),
  headlineMedium: typeTheme.headlineMedium?.copyWith(fontSize: 21),
  headlineSmall: typeTheme.headlineSmall?.copyWith(fontSize: 18),
  titleLarge: typeTheme.titleLarge?.copyWith(fontSize: 16),
  titleMedium: typeTheme.titleMedium?.copyWith(fontSize: 24),
  titleSmall: typeTheme.titleSmall?.copyWith(fontSize: 21),
);

ThemeData light = ThemeData(
    fontFamily: 'regular',
    primaryColor: ThemeProvider.appColor,
    secondaryHeaderColor: ThemeProvider.secondaryAppColor,
    disabledColor: const Color(0xFFBABFC4),
    brightness: Brightness.light,
    hintColor: const Color(0xFF9F9F9F),
    cardColor: ThemeProvider.appColor,
    colorScheme: const ColorScheme.light(
        primary: ThemeProvider.appColor,
        secondary: ThemeProvider.secondaryAppColor),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeProvider.appColor)),
    textTheme: txtTheme);

ThemeData dark = ThemeData(
    fontFamily: 'regular',
    primaryColor: ThemeProvider.blackColor,
    secondaryHeaderColor: const Color(0xFF009f67),
    disabledColor: const Color(0xffa2a7ad),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFbebebe),
    cardColor: Colors.black,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeProvider.blackColor)),
    textTheme: txtTheme,
    colorScheme: const ColorScheme.dark(
            primary: ThemeProvider.blackColor, secondary: Color(0xFFffbd5c))
        .copyWith(surface: const Color(0xFF343636))
        .copyWith(surface: const Color(0xFF343636))
        .copyWith(error: const Color(0xFFdd3135)));
