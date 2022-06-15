import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../../models/zekrtype.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import 'components/display_zekr.dart';
import 'components/footer_widget.dart';
import 'components/linear_percent.dart';
import 'details_view_model.dart';

class Details extends StatelessWidget {
  final DetailsViewModel viewModel;
  const Details({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await viewModel.onWillPop(context);
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Consumer<DetailsViewModel>(
          builder: (context, _, child) {
            return PageView(
              physics: const BouncingScrollPhysics(),
              controller: viewModel.pageController,
              reverse: true,
              onPageChanged: (int currentIndex) {
                viewModel.onPageChange(currentIndex);
              },
              children: _buildPageViewBody(
                azkar: viewModel.getZekr(),
                viewModel: viewModel,
              ),
            );
          },
        ),
      ),
    );
  }

  List<Padding> _buildPageViewBody({
    required List<Zekr> azkar,
    required DetailsViewModel viewModel,
  }) {
    return azkar.map((Zekr zekr) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10.w,
          vertical: AppPadding.p10.h,
        ),
        child: GestureDetector(
          onTap: () {
            viewModel.onPressedZekr(zekr);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LinearPercent(
                azkar: azkar,
                viewModel: viewModel,
              ),
              SizedBox(height: AppSize.s10.h),
              DisplayZekr(zekr: zekr),
              FooterWidget(viewModel: viewModel),
            ],
          ),
        ),
      );
    }).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    return appBarWidget(
      title: AutoSizeText(
        viewModel.category.title,
        style: getBoldStyle(
          color: ColorManager.black,
          fontsize: FontSize.s20,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          viewModel.resetPageIndx(context);
          viewModel.restCircleStart(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      height: AppSize.s40.h,
    );
  }
}
