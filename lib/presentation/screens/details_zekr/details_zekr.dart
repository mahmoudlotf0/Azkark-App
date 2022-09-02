import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

import 'components/display_zekr.dart';
import 'components/footer_widget.dart';
import 'details_zekr_view_model.dart';

class DetailsZekr extends StatelessWidget {
  final DetailsZekrViewModel viewModel;
  const DetailsZekr({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p10.w,
            vertical: AppPadding.p10.h,
          ),
          child: Column(
            children: [
              HeaderWidget(viewModel: viewModel),
              const DisplayZekr(),
              SizedBox(height: AppSize.s10.h),
              FooterWidget(viewModel: viewModel),
            ],
          ),
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return appBarWidget(
      title: viewModel.category.title,
      leading: IconButton(
        onPressed: () {
          viewModel.onPressedLeadingIcon(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final DetailsZekrViewModel viewModel;
  const HeaderWidget({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20.h,
      child: Row(
        children: [
          _buildIndexAndLength(),
          _buildLinearIndicator(),
        ],
      ),
    );
  }

  Widget _buildLinearIndicator() {
    return Expanded(
      child: Consumer<DetailsZekrViewModel>(
        builder: (_, provider, __) => LinearPercentIndicator(
          barRadius: Radius.circular(10.r),
          animation: true,
          padding:
              EdgeInsets.only(bottom: AppPadding.p5.r, left: AppPadding.p8.r),
          animateFromLastPercent: true,
          percent: provider.pageIndex + 1 == provider.azkar.length
              ? 1.0
              : provider.pageIndex / provider.azkar.length,
          isRTL: true,
          progressColor: ColorManager.primary,
          backgroundColor: ColorManager.grey,
          lineHeight: 15,
        ),
      ),
    );
  }

  Widget _buildIndexAndLength() {
    return Consumer<DetailsZekrViewModel>(
      builder: (context, provider, __) => AutoSizeText(
        '${provider.azkar.length}' ' / ' '${provider.pageIndex + 1}',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
