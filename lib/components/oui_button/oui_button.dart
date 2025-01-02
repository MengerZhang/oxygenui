import 'package:flutter/material.dart';
import 'package:oxygenui/components/oui_button/oui_button_size.dart';
import 'package:oxygenui/components/oui_button/oui_button_status.dart';
import 'package:oxygenui/components/oui_button/oui_button_theme.dart';
import 'package:oxygenui/components/oui_spacer/oui_spacer.dart';
import 'package:oxygenui/theme/oui_theme.dart';

typedef OuiButtonStatusChangedCallback = void Function(OuiButtonStatus status);

class OuiButton extends StatefulWidget {
  // Width
  final double? width;
  // Height
  final double? height;
  // BorderRadius
  final double? radius;
  // Size
  final OuiButtonSize size;
  // Theme
  final OuiButtonTheme theme;
  // Color
  final OuiColorSet? color;
  // Active Color
  final OuiColorSet? activeColor;
  // BoxShadow
  final List<BoxShadow>? boxShadow;
  // Gap between icon and text
  final double? gap;
  // Click Event
  final void Function()? onTap;
  // Status Change Event
  final OuiButtonStatusChangedCallback? onStatusChange;
  // MainAxisAlignment, default is center
  final MainAxisAlignment mainAxisAlignment;
  // CrossAxisAlignment, default is center
  final CrossAxisAlignment crossAxisAlignment;
  // Icon
  final Icon? icon;
  // Text
  final String text;
  const OuiButton(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.size = OuiButtonSize.medium,
      this.theme = OuiButtonTheme.primary,
      this.color,
      this.activeColor,
      this.boxShadow,
      this.gap,
      this.onTap,
      this.onStatusChange,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.icon,
      this.text = "OuiButton"});

  @override
  State<OuiButton> createState() => _OuiButtonState();
}

class _OuiButtonState extends State<OuiButton>
    with SingleTickerProviderStateMixin {
  OuiButtonStatus status = OuiButtonStatus.normal;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;

  OuiColorSet generateColor() {
    return OuiColorSet(
        main: _backgroundColorAnimation.value ??
            generateNormalColorByTheme().main,
        sub: _textColorAnimation.value ?? generateNormalColorByTheme().sub);
  }

  List<BoxShadow> generateBoxShadow() {
    if (widget.theme == OuiButtonTheme.primary) {
      return widget.boxShadow ?? OuiTheme.primaryBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.disabled) {
      return widget.boxShadow ?? OuiTheme.disabledBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.warning) {
      return widget.boxShadow ?? OuiTheme.warningBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.danger) {
      return widget.boxShadow ?? OuiTheme.dangerBoxShadow;
    }
    return widget.boxShadow ?? OuiTheme.primaryBoxShadow;
  }

  EdgeInsets generatePadding() {
    if (widget.size == OuiButtonSize.small) {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    }
    if (widget.size == OuiButtonSize.medium) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
    if (widget.size == OuiButtonSize.large) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  OuiColorSet generateNormalColorByTheme() {
    if (widget.theme == OuiButtonTheme.primary) {
      return widget.color ?? OuiTheme.primaryColor;
    }
    if (widget.theme == OuiButtonTheme.disabled) {
      return widget.color ?? OuiTheme.disabledColor;
    }
    if (widget.theme == OuiButtonTheme.warning) {
      return widget.color ?? OuiTheme.warningColor;
    }
    if (widget.theme == OuiButtonTheme.danger) {
      return widget.color ?? OuiTheme.dangerColor;
    }
    return widget.color ?? OuiTheme.primaryColor;
  }

  OuiColorSet generateActiveColorByTheme() {
    if (widget.theme == OuiButtonTheme.primary) {
      return widget.activeColor ?? OuiTheme.primaryActiveColor;
    }
    if (widget.theme == OuiButtonTheme.disabled) {
      return widget.activeColor ?? OuiTheme.disabledActiveColor;
    }
    if (widget.theme == OuiButtonTheme.warning) {
      return widget.activeColor ?? OuiTheme.warningActiveColor;
    }
    if (widget.theme == OuiButtonTheme.danger) {
      return widget.activeColor ?? OuiTheme.dangerActiveColor;
    }
    return widget.activeColor ?? OuiTheme.primaryActiveColor;
  }

  List<Widget> generateIcon() {
    if (widget.icon == null) {
      return [];
    }
    Color? color = widget.icon!.color;
    if (widget.icon!.color == null) {
      color = generateColor().sub;
    }
    return [
      Icon(
        widget.icon?.icon,
        color: color,
        size: widget.icon?.size,
        fill: widget.icon?.fill,
        weight: widget.icon?.weight,
        grade: widget.icon?.grade,
        opticalSize: widget.icon?.opticalSize,
        shadows: widget.icon?.shadows,
        semanticLabel: widget.icon?.semanticLabel,
        textDirection: widget.icon?.textDirection,
        applyTextScaling: widget.icon?.applyTextScaling,
        blendMode: widget.icon?.blendMode,
      ),
      OuiSpacer(width: widget.gap ?? OuiTheme.buttonGap)
    ];
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnimation = Tween(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _backgroundColorAnimation = ColorTween(
            begin: generateNormalColorByTheme().main,
            end: generateActiveColorByTheme().main)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _textColorAnimation = ColorTween(
            begin: generateNormalColorByTheme().sub,
            end: generateActiveColorByTheme().sub)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            status = OuiButtonStatus.active;
          });
          widget.onStatusChange?.call(status);
          _animationController.forward(from: 0.0);
        },
        onTapUp: (details) {
          setState(() {
            status = OuiButtonStatus.normal;
          });
          widget.onStatusChange?.call(status);
          _animationController.reverse(from: 1.0);
        },
        onTap: widget.onTap,
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                    width: widget.width,
                    height: widget.height,
                    padding: generatePadding(),
                    decoration: BoxDecoration(
                        color: generateColor().main,
                        borderRadius: BorderRadius.circular(
                            widget.radius ?? OuiTheme.buttonRadius),
                        boxShadow: generateBoxShadow()),
                    child: Row(
                      mainAxisAlignment: widget.mainAxisAlignment,
                      crossAxisAlignment: widget.crossAxisAlignment,
                      children: [
                        ...generateIcon(),
                        Text(
                          widget.text,
                          style: TextStyle(color: generateColor().sub),
                        )
                      ],
                    )),
              );
            }));
  }
}
