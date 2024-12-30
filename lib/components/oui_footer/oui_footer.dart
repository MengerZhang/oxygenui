import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oxygenui/components/oui_footer/oui_footer_direction.dart';
import 'package:oxygenui/components/oui_spacer/oui_spacer.dart';
import 'package:oxygenui/theme/oui_theme.dart';

class OuiFooter extends StatefulWidget {
  // 方向
  final OuiFooterDirection direction;
  // 间隔
  final double gap;
  // 子级
  final List<Widget> children;

  const OuiFooter({
    super.key,
    this.direction = OuiFooterDirection.row,
    this.gap = 8,
    required this.children,
  });

  @override
  State<OuiFooter> createState() => _OuiFooterState();
}

class _OuiFooterState extends State<OuiFooter> {
  Widget parseChildren() {
    if (widget.direction == OuiFooterDirection.row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.children
            .asMap()
            .entries
            .map((item) {
              return [
                Expanded(child: item.value),
                OuiSpacer(
                  width: item.key < widget.children.length - 1 ? widget.gap : 0,
                )
              ];
            })
            .expand<Widget>((item) => item)
            .toList(),
      );
    }
    if (widget.direction == OuiFooterDirection.column) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.children
            .asMap()
            .entries
            .map((item) => [
                  item.value,
                  OuiSpacer(
                    height:
                        item.key < widget.children.length - 1 ? widget.gap : 0,
                  )
                ])
            .expand((item) => item)
            .toList(),
      );
    }
    return Container(
      decoration: BoxDecoration(color: OuiTheme.dangerColor.main),
      child: Center(
        child: Text(
          "Children",
          style: TextStyle(color: OuiTheme.dangerColor.sub),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: OuiTheme.navigationColor.main),
      child: parseChildren(),
    );
  }
}
