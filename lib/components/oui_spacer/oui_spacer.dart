import 'package:flutter/widgets.dart';

class OuiSpacer extends StatefulWidget {
  final double width;
  final double height;
  const OuiSpacer({super.key, this.width = 8, this.height = 8});

  @override
  State<OuiSpacer> createState() => _OuiSpacerState();
}

class _OuiSpacerState extends State<OuiSpacer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
    );
  }
}