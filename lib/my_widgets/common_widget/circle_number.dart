import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget circleNumber(int start, double progress, BuildContext context) {
  return CircularPercentIndicator(
    radius: 80.0,
    lineWidth: 5.0,
    percent: progress.clamp(0.0, 1.0),
    center: Text("$start", style: Theme.of(context).textTheme.headline2),
    progressColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.grey,
  );
}
