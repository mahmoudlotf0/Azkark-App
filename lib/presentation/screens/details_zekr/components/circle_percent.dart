import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../resources/color_manager.dart';

import '../details_zekr_view_model.dart';

class CirclePercent extends StatelessWidget {
  final DetailsZekrViewModel viewModel;
  const CirclePercent({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Consumer<DetailsZekrViewModel>(
        builder: (_, provider, __) => CircularPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 300,
          radius: 80.0.r,
          lineWidth: 5.0.w,
          percent: provider.progress.clamp(0.0, 1.0),
          center: AutoSizeText(
            "${provider.start}",
            style: Theme.of(context).textTheme.headline3,
          ),
          progressColor: ColorManager.primary,
          backgroundColor: ColorManager.grey,
        ),
      ),
    );
  }
}
