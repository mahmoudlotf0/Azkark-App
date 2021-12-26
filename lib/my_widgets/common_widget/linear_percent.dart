import 'package:azkarapp/models/zekrtype.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget linearPercent(
    int pageIndex, List<ZekrType> _displayZekr, BuildContext context) {
  return LinearPercentIndicator(
    percent: pageIndex + 1 == _displayZekr.length
        ? 1.0
        : pageIndex / _displayZekr.length,
    isRTL: true,
    // width: 250.0,
    progressColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.grey[400],
    lineHeight: 8.0,
  );
}
