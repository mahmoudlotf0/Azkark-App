import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../resources/values_manager.dart';

import 'components/display_zekr.dart';
import 'components/footer_widget.dart';
import 'components/linear_percent.dart';
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
              LinearPercent(viewModel: viewModel),
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
