import 'package:flutter/material.dart';
import 'package:oxygenui/components/oui_button/oui_button_status.dart';
import 'package:oxygenui/theme/oui_theme.dart';

class OuiButton extends StatefulWidget {
  // 自定义宽度
  final double? width;
  // 自定义高度
  final double? height;
  // 圆角
  final double? radius;
  // 点击事件
  final void Function()? onTap;
  // 主轴对齐，默认居中
  final MainAxisAlignment mainAxisAlignment;
  // 交叉轴队其，默认剧中
  final CrossAxisAlignment crossAxisAlignment;
  // 子级Widget列表
  final List<Widget> children;
  const OuiButton(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.onTap,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.children = const []});

  @override
  State<OuiButton> createState() => _OuiButtonState();
}

class _OuiButtonState extends State<OuiButton> {
  OuiButtonStatus status = OuiButtonStatus.normal;

  OuiColorSet generateBackground() {
    if (status == OuiButtonStatus.normal) {
      return OuiTheme.primaryColor;
    }
    if (status == OuiButtonStatus.active) {
      return OuiTheme.navigationColor;
    }
    return OuiTheme.primaryColor;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          status = OuiButtonStatus.active;
        });
      },
      onTapUp: (details) {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            status = OuiButtonStatus.normal;
          });
        });
      },
      onTap: widget.onTap,
      child: Container(
          width: widget.width,
          height: widget.height ?? OuiTheme.buttonHeight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: generateBackground().main,
              borderRadius:
                  BorderRadius.circular(widget.radius ?? OuiTheme.buttonRadius),
              boxShadow: OuiTheme.primaryBoxShadow),
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            children: widget.children,
          )),
    );
  }
}
