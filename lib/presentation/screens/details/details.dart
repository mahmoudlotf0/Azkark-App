import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/appbar_widget.dart';
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
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p10.w,
              vertical: AppPadding.p10.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercent(
                  azkar: viewModel.getZekr(),
                  viewModel: viewModel,
                ),
                _buildPageView(),
              ],
            ),
          ),
        ));
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: viewModel.pageController,
        reverse: true,
        onPageChanged: (int currentIndex) {
          viewModel.onPageChange(currentIndex);
        },
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              viewModel.onPressedZekr(viewModel.getZekr()[index]);
            },
            child: Column(
              children: [
                SizedBox(height: AppSize.s10.h),
                DisplayZekr(zekr: viewModel.getZekr()[index]),
                FooterWidget(viewModel: viewModel),
              ],
            ),
          );
        },
        itemCount: viewModel.getZekr().length,
      ),
    );
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
          viewModel.resetPageIndex(context);
          viewModel.restCircleStart(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      height: AppSize.s40.h,
    );
  }
}
