import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../models/zekrtype.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';
import '../details_view_model.dart';

class LinearPercent extends StatelessWidget {
  final DetailsViewModel viewModel;
  final List<Zekr> azkar;
  const LinearPercent({required this.azkar, required this.viewModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsViewModel detailsProvider = DetailsViewModel.getObject(context);
    return Row(
      children: [
        _buildIndexAndLength(detailsProvider: detailsProvider),
        _buildLinearIndicator(detailsProvider: detailsProvider),
      ],
    );
  }

  Widget _buildLinearIndicator({required DetailsViewModel detailsProvider}) {
    return Expanded(
      child: LinearPercentIndicator(
        percent: detailsProvider.pageIndex + 1 == azkar.length
            ? 1.0
            : detailsProvider.pageIndex / azkar.length,
        isRTL: true,
        progressColor: ColorManager.darkRed,
        backgroundColor: ColorManager.lightGrey,
        lineHeight: AppSize.s7.h,
      ),
    );
  }

  Widget _buildIndexAndLength({required DetailsViewModel detailsProvider}) {
    return SizedBox(
      width: 50.w,
      child: AutoSizeText(
        '${detailsProvider.pageIndex + 1}' '/' '${azkar.length}',
        style: getBoldStyle(
          color: ColorManager.black,
          fontsize: FontSize.s18,
        ),
      ),
    );
  }
}
