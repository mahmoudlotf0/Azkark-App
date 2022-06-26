import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../details_zekr_view_model.dart';

class LinearPercent extends StatelessWidget {
  final DetailsZekrViewModel viewModel;
  const LinearPercent({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIndexAndLength(),
        _buildLinearIndicator(),
      ],
    );
  }

  Widget _buildLinearIndicator() {
    return Expanded(
      child: Consumer<DetailsZekrViewModel>(
        builder: (_, provider, __) => LinearPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          percent: provider.pageIndex + 1 == provider.azkar.length
              ? 1.0
              : provider.pageIndex / provider.azkar.length,
          isRTL: true,
          progressColor: ColorManager.primary,
          backgroundColor: ColorManager.grey,
          lineHeight: AppSize.s7.h,
        ),
      ),
    );
  }

  Widget _buildIndexAndLength() {
    return SizedBox(
      width: 50.w,
      height: 25.h,
      child: Consumer<DetailsZekrViewModel>(
        builder: (context, provider, __) => AutoSizeText(
          '${provider.azkar.length}' '/' '${provider.pageIndex + 1}',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
