import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oxygenui/components/oui_footer/oui_footer_direction.dart';
import 'package:oxygenui/components/oui_spacer/oui_spacer.dart';
import 'package:oxygenui/theme/oui_theme.dart';

class OuiFooter extends StatefulWidget {
  /// [OuiFooterDirection.row] or [OuiFooterDirection.column]
  final OuiFooterDirection direction;
  // 间隔
  final double gap;

  // Is children expand enable
  final bool shouldExpandChildren;

  // Children Alignment
  final Alignment alignment;

  // 子级
  final List<Widget> children;

  const OuiFooter({
    super.key,
    this.direction = OuiFooterDirection.row,
    this.gap = 8,
    this.shouldExpandChildren = true,
    this.alignment = Alignment.centerLeft,
    required this.children,
  });

  @override
  State<OuiFooter> createState() => _OuiFooterState();
}

class _OuiFooterState extends State<OuiFooter> {
  OuiFooterAlignment generateRowMainAxisAlignment() {
    if (widget.alignment == Alignment.bottomCenter) {
      return const OuiFooterAlignment(
          MainAxisAlignment.center, CrossAxisAlignment.end);
    }
    if (widget.alignment == Alignment.bottomLeft) {
      return const OuiFooterAlignment(
          MainAxisAlignment.start, CrossAxisAlignment.end);
    }
    if (widget.alignment == Alignment.bottomRight) {
      return const OuiFooterAlignment(
          MainAxisAlignment.end, CrossAxisAlignment.end);
    }
    if (widget.alignment == Alignment.center) {
      return const OuiFooterAlignment(
          MainAxisAlignment.center, CrossAxisAlignment.center);
    }
    if (widget.alignment == Alignment.centerLeft) {
      return const OuiFooterAlignment(
          MainAxisAlignment.start, CrossAxisAlignment.center);
    }
    if (widget.alignment == Alignment.centerRight) {
      return const OuiFooterAlignment(
          MainAxisAlignment.end, CrossAxisAlignment.center);
    }
    if (widget.alignment == Alignment.topCenter) {
      return const OuiFooterAlignment(
          MainAxisAlignment.center, CrossAxisAlignment.start);
    }
    if (widget.alignment == Alignment.topLeft) {
      return const OuiFooterAlignment(
          MainAxisAlignment.start, CrossAxisAlignment.start);
    }
    if (widget.alignment == Alignment.topRight) {
      return const OuiFooterAlignment(
          MainAxisAlignment.end, CrossAxisAlignment.start);
    }
    return const OuiFooterAlignment(
        MainAxisAlignment.start, CrossAxisAlignment.center);
  }

  Widget generateChildren() {
    if (widget.direction == OuiFooterDirection.row) {
      return Row(
        mainAxisAlignment: generateRowMainAxisAlignment().mainAxisAlignment,
        crossAxisAlignment: generateRowMainAxisAlignment().crossAxisAlignment,
        children: widget.children
            .asMap()
            .entries
            .map((item) {
              return [
                widget.shouldExpandChildren
                    ? Expanded(child: item.value)
                    : item.value,
                OuiSpacer(
                  width: item.key < widget.children.length - 1 ? widget.gap : 0,
                )
              ];
            })
            .expand((item) => item)
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
      child: generateChildren(),
    );
  }
}
