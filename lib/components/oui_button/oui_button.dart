import 'package:flutter/material.dart';
import 'package:oxygenui/components/oui_button/oui_button_status.dart';
import 'package:oxygenui/components/oui_button/oui_button_theme.dart';
import 'package:oxygenui/theme/oui_theme.dart';

class OuiButton extends StatefulWidget {
  // Width
  final double? width;
  // Height
  final double? height;
  // BorderRadius
  final double? radius;
  // Theme
  final OuiButtonTheme theme;
  // Click Event
  final void Function()? onTap;
  // MainAxisAlignment, default is center
  final MainAxisAlignment mainAxisAlignment;
  // CrossAxisAlignment, default is center
  final CrossAxisAlignment crossAxisAlignment;
  // Children Widgets
  final List<Widget> children;
  const OuiButton(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.theme = OuiButtonTheme.primary,
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
    // Primary
    // Normal
    if (widget.theme == OuiButtonTheme.primary &&
        status == OuiButtonStatus.normal) {
      return OuiTheme.primaryColor;
    }
    // Active
    if (widget.theme == OuiButtonTheme.primary &&
        status == OuiButtonStatus.active) {
      return OuiTheme.primaryActiveColor;
    }

    // Disabled
    // Normal
    if (widget.theme == OuiButtonTheme.disabled &&
        status == OuiButtonStatus.normal) {
      return OuiTheme.disabledColor;
    }
    // Active
    if (widget.theme == OuiButtonTheme.disabled &&
        status == OuiButtonStatus.active) {
      return OuiTheme.disabledActiveColor;
    }

    // Warning
    // Normal
    if (widget.theme == OuiButtonTheme.warning &&
        status == OuiButtonStatus.normal) {
      return OuiTheme.warningColor;
    }
    // Active
    if (widget.theme == OuiButtonTheme.warning &&
        status == OuiButtonStatus.active) {
      return OuiTheme.warningActiveColor;
    }

    // Danger
    // Normal
    if (widget.theme == OuiButtonTheme.danger &&
        status == OuiButtonStatus.normal) {
      return OuiTheme.dangerColor;
    }
    // Active
    if (widget.theme == OuiButtonTheme.danger &&
        status == OuiButtonStatus.active) {
      return OuiTheme.dangerActiveColor;
    }

    return OuiTheme.primaryColor;
  }

  List<BoxShadow> generateBoxShadow() {
    if (widget.theme == OuiButtonTheme.primary) {
      return OuiTheme.primaryBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.disabled) {
      return OuiTheme.disabledBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.warning) {
      return OuiTheme.warningBoxShadow;
    }
    if (widget.theme == OuiButtonTheme.danger) {
      return OuiTheme.dangerBoxShadow;
    }
    return OuiTheme.primaryBoxShadow;
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
              boxShadow: generateBoxShadow()),
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            children: widget.children,
          )),
    );
  }
}
