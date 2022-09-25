import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget({
  required String title,
  List<Widget>? actions,
  Widget? leading,
}) {
  return AppBar(
    elevation: 0,
    title: AutoSizeText(
      title,
      maxLines: 3,
    ),
    actions: actions,
    leading: leading,
  );
}
