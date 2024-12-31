import 'package:flutter/material.dart';

class OuiColors {
  // Primary
  static const Color primary = Color(0xff3F51B5);
  static const Color primaryReverse = Color(0xffffffff);
  static const Color primaryActive = Color(0xee3F51B5);
  static const Color primaryActiveReverse = Color(0xffffffff);

  // Disabled
  static const Color disabled = Color(0xff9E9E9E);
  static const Color disabledReverse = Color(0xff757575);
  static const Color disabledActive = Color(0xff9E9E9E);
  static const Color disabledActiveReverse = Color(0xff757575);

  // Warning
  static const Color warning = Color(0xffff9800);
  static const Color warningReverse = Color(0xffffffff);
  static const Color warningActive = Color(0xeeff9800);
  static const Color warningActiveReverse = Color(0xffffffff);

  // Danger
  static const Color danger = Color(0xffF44336);
  static const Color dangerReverse = Color(0xffffffff);
  static const Color dangerActive = Color(0xeeF44336);
  static const Color dangerActiveReverse = Color(0xffffffff);
}

class OuiColorSet {
  // Main Color, Example: background-color of button
  final Color main;
  // Sub Color, Example: text-color of button
  final Color sub;
  const OuiColorSet({required this.main, required this.sub});
}

class OuiTheme {
  // Primary Color
  static const OuiColorSet primaryColor =
      OuiColorSet(main: OuiColors.primary, sub: OuiColors.primaryReverse);
  // Primary Color
  static const OuiColorSet primaryActiveColor = OuiColorSet(
      main: OuiColors.primaryActive, sub: OuiColors.primaryActiveReverse);

  // Disabled Color
  static const OuiColorSet disabledColor =
      OuiColorSet(main: OuiColors.disabled, sub: OuiColors.disabledReverse);
  // Disabled Color
  static const OuiColorSet disabledActiveColor = OuiColorSet(
      main: OuiColors.disabledActive, sub: OuiColors.disabledActiveReverse);

  // Warning Color
  static const OuiColorSet warningColor =
      OuiColorSet(main: OuiColors.warning, sub: OuiColors.warningReverse);
  // Warning Color
  static const OuiColorSet warningActiveColor = OuiColorSet(
      main: OuiColors.warningActive, sub: OuiColors.warningActiveReverse);

  // Danger Color
  static const OuiColorSet dangerColor =
      OuiColorSet(main: OuiColors.danger, sub: OuiColors.dangerReverse);
  // Danger Color
  static const OuiColorSet dangerActiveColor = OuiColorSet(
      main: OuiColors.dangerActive, sub: OuiColors.dangerActiveReverse);

  // Navigation Color, Color of Appbar or Tabbar
  static const OuiColorSet navigationColor =
      OuiColorSet(main: Colors.white, sub: OuiColors.primary);

  // Default Button Radius
  static const double buttonRadius = 6;
  // Default Button Height
  // static const double buttonHeight = 44;

  // Default BoxShadow for Primary Color
  static const List<BoxShadow> primaryBoxShadow = [
    BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, .1)),
    BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 2,
        spreadRadius: -1,
        color: Color.fromRGBO(0, 0, 0, .1))
  ];

  // Disabled颜色对应的阴影
  static const List<BoxShadow> disabledBoxShadow = [
    BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.05)),
    BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        spreadRadius: -1,
        color: Color.fromRGBO(0, 0, 0, 0.05))
  ];

  // Warning颜色对应的阴影
  static const List<BoxShadow> warningBoxShadow = [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color.fromRGBO(255, 152, 0, 0.15)),
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 3,
        spreadRadius: -1,
        color: Color.fromRGBO(255, 152, 0, 0.15))
  ];

  // Danger颜色对应的阴影
  static const List<BoxShadow> dangerBoxShadow = [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 5,
        spreadRadius: 0,
        color: Color.fromRGBO(244, 67, 54, 0.2)),
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: -1,
        color: Color.fromRGBO(244, 67, 54, 0.2))
  ];
}
