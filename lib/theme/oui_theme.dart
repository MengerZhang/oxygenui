import 'package:flutter/widgets.dart';

// 颜色，这组颜色来自于Shadcn, 官网: https://ui.shadcn.com/
class OuiColors {
  static const Color color_50 = Color(0xfff8fafc);
  static const Color color_100 = Color(0xfff1f5f9);
  static const Color color_200 = Color(0xffe2e8f0);
  static const Color color_300 = Color(0xffcbd5e1);
  static const Color color_400 = Color(0xff94a3b8);
  static const Color color_500 = Color(0xff64748b);
  static const Color color_600 = Color(0xff475569);
  static const Color color_700 = Color(0xff334155);
  static const Color color_800 = Color(0xff1e293b);
  static const Color color_900 = Color(0xff0f172a);
  static const Color color_950 = Color(0xff020617);
  static const Color white = Color(0xffffffff);
  static const Color danger = Color(0xfff14c5d);
}

class OuiColorSet {
  // 主色，例如按钮的背景颜色
  final Color main;
  // 副色，例如按钮的文本颜色
  final Color sub;
  const OuiColorSet({required this.main, required this.sub});
}

class OuiTheme {
  // 主题色
  static const OuiColorSet primaryColor =
      OuiColorSet(main: OuiColors.color_900, sub: OuiColors.color_50);
  // 危险色
  static const OuiColorSet dangerColor = OuiColorSet(main: OuiColors.danger, sub: OuiColors.white);
  // 导航栏颜色
  static const OuiColorSet navigationColor =
      OuiColorSet(main: OuiColors.white, sub: OuiColors.color_950);
  // 按钮圆角
  static const double buttonRadius = 6;
  // 按钮高度
  static const double buttonHeight = 44;
  // 主题色对应的阴影
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
}
