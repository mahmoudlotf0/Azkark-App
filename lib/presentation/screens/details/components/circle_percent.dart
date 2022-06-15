import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';

import '../details_view_model.dart';

class CirclePercent extends StatelessWidget {
  final DetailsViewModel viewModel;
  const CirclePercent({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsViewModel>(
      builder: (context, provider, _) {
        return Expanded(
          flex: 4,
          child: CircularPercentIndicator(
            radius: 80.0.r,
            lineWidth: 5.0.w,
            percent: provider.progress.clamp(0.0, 1.0),
            center: AutoSizeText(
              "${provider.start}",
              style: getBoldStyle(
                color: ColorManager.black,
                fontsize: FontSize.s25,
              ),
            ),
            progressColor: ColorManager.darkRed,
            backgroundColor: Colors.grey,
          ),
        );
      },
    );
  }
}
