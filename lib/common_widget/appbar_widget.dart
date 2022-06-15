import 'package:flutter/material.dart';

AppBar appBarWidget({
  required Widget title,
  List<Widget>? actions,
  Widget? leading,
  double? height,
}) {
  return AppBar(
    elevation: 0,
    title: title,
    actions: actions,
    centerTitle: true,
    toolbarHeight: height,
    leading: leading,
  );
}
