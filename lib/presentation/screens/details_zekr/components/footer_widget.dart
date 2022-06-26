import 'package:azkarapp/presentation/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../details_zekr_view_model.dart';
import 'circle_percent.dart';
import 'icon_copy.dart';
import 'number_of_iteration.dart';

class FooterWidget extends StatelessWidget {
  final DetailsZekrViewModel viewModel;
  const FooterWidget({required this.viewModel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppConstants.borderRadius),
        topRight: Radius.circular(AppConstants.borderRadius),
      ),
      elevation: AppConstants.elevation,
      child: SizedBox(
        width: double.infinity,
        height: 90.h,
        child: Row(
          children: [
            IconCopy(viewModel: viewModel),
            CirclePercent(viewModel: viewModel),
            NumberOfIteration(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
