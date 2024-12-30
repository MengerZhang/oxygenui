import 'package:flutter/material.dart';
import 'package:oxygenui/components/oui_button/oui_button.dart';
import 'package:oxygenui/theme/oui_theme.dart';

class OuiTextButton extends OuiButton {
  final String text;
  const OuiTextButton(
      {super.key,
      super.width,
      super.height,
      super.radius,
      super.theme,
      super.mainAxisAlignment,
      super.crossAxisAlignment,
      super.onTap,
      required this.text});

  @override
  State<OuiTextButton> createState() => _OuiTextButtonState();
}

class _OuiTextButtonState extends State<OuiTextButton> {
  @override
  Widget build(BuildContext context) {
    return OuiButton(
      onTap: widget.onTap,
      width: widget.width,
      radius: widget.radius,
      theme: widget.theme,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: OuiTheme.primaryColor.sub),
        )
      ],
    );
  }
}
