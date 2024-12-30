import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Color from Shadcn, Shadcn Offical Website: https://ui.shadcn.com/
class OuiColors {
  // Primary颜色系列（原有的保持不变，方便对照查看）
  static const Color primary_50 = Color(0xfff8fafc);
  static const Color primary_100 = Color(0xfff1f5f9);
  static const Color primary_200 = Color(0xffe2e8f0);
  static const Color primary_300 = Color(0xffcbd5e1);
  static const Color primary_400 = Color(0xff94a3b8);
  static const Color primary_500 = Color(0xff64748b);
  static const Color primary_600 = Color(0xff475569);
  static const Color primary_700 = Color(0xff334155);
  static const Color primary_800 = Color(0xff1e293b);
  static const Color primary_900 = Color(0xff0f172a);
  static const Color primary_950 = Color(0xff020617);

  // Disabled颜色系列
  static const Color disabled_50 = Color(0xfffdfdfd);
  static const Color disabled_100 = Color(0xfff8f8f8);
  static const Color disabled_200 = Color(0xfff3f3f3);
  static const Color disabled_300 = Color(0xffededed);
  static const Color disabled_400 = Color(0xffd6d6d6);
  static const Color disabled_500 = Color(0xffb3b3b3);
  static const Color disabled_600 = Color(0xff969696);
  static const Color disabled_700 = Color(0xff7a7a7a);
  static const Color disabled_800 = Color(0xff5c5c5c);
  static const Color disabled_900 = Color(0xff3e3e3e);
  static const Color disabled_950 = Color(0xff232323);

  // Warning颜色系列
  static const Color warning_50 = Color(0xfffff8e1);
  static const Color warning_100 = Color(0xffffecb3);
  static const Color warning_200 = Color(0xffffe082);
  static const Color warning_300 = Color(0xffffd54f);
  static const Color warning_400 = Color(0xffffca28);
  static const Color warning_500 = Color(0xffffc107);
  static const Color warning_600 = Color(0xffffb300);
  static const Color warning_700 = Color(0xffffa000);
  static const Color warning_800 = Color(0xffff8f00);
  static const Color warning_900 = Color(0xffff7000);
  static const Color warning_950 = Color(0xffff5200);

  // Danger颜色系列
  static const Color danger_50 = Color(0xfffff3f3);
  static const Color danger_100 = Color(0xffffe6e6);
  static const Color danger_200 = Color(0xffffcccb);
  static const Color danger_300 = Color(0xffffb2af);
  static const Color danger_400 = Color(0xffff9995);
  static const Color danger_500 = Color(0xffff7066);
  static const Color danger_600 = Color(0xffff5c52);
  static const Color danger_700 = Color(0xffff453a);
  static const Color danger_800 = Color(0xffff3124);
  static const Color danger_900 = Color(0xffff1700);
  static const Color danger_950 = Color(0xffe60000);
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
      OuiColorSet(main: OuiColors.primary_900, sub: OuiColors.primary_50);
  // Primary Color
  static const OuiColorSet primaryActiveColor =
      OuiColorSet(main: OuiColors.primary_800, sub: OuiColors.primary_50);

  // Disabled Color
  static const OuiColorSet disabledColor =
      OuiColorSet(main: OuiColors.disabled_950, sub: OuiColors.primary_50);
  // Disabled Color
  static const OuiColorSet disabledActiveColor =
      OuiColorSet(main: OuiColors.disabled_800, sub: OuiColors.primary_50);

  // Warning Color
  static const OuiColorSet warningColor =
      OuiColorSet(main: OuiColors.warning_800, sub: OuiColors.danger_50);
  // Warning Color
  static const OuiColorSet warningActiveColor =
      OuiColorSet(main: OuiColors.warning_950, sub: OuiColors.danger_50);

  // Danger Color, default is #f14c5d
  static const OuiColorSet dangerColor =
      OuiColorSet(main: OuiColors.danger_800, sub: OuiColors.danger_50);
  // Danger Color, default is #f14c5d
  static const OuiColorSet dangerActiveColor =
      OuiColorSet(main: OuiColors.danger_950, sub: OuiColors.danger_50);

  // Navigation Color, Color of Appbar or Tabbar
  static const OuiColorSet navigationColor =
      OuiColorSet(main: Colors.white, sub: OuiColors.primary_950);

  // Default Button Radius
  static const double buttonRadius = 6;
  // Default Button Height
  static const double buttonHeight = 44;

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
        color: Color.fromRGBO(190, 190, 190, .2)),
    BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        spreadRadius: -1,
        color: Color.fromRGBO(190, 190, 190, .2))
  ];

  // Warning颜色对应的阴影
  static const List<BoxShadow> warningBoxShadow = [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color.fromRGBO(255, 165, 0, .2)),
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 3,
        spreadRadius: -1,
        color: Color.fromRGBO(255, 165, 0, .2))
  ];

  // Danger颜色对应的阴影
  static const List<BoxShadow> dangerBoxShadow = [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 5,
        spreadRadius: 0,
        color: Color.fromRGBO(255, 0, 0, .2)),
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: -1,
        color: Color.fromRGBO(255, 0, 0, .2))
  ];
}
