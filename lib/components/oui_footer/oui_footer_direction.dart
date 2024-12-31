import 'package:flutter/widgets.dart';

enum OuiFooterDirection { row, column }

class OuiFooterAlignment {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const OuiFooterAlignment(this.mainAxisAlignment, this.crossAxisAlignment);
}