import 'package:auto_size_text/auto_size_text.dart';
import 'package:azkarapp/presentation/resources/values_manager.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../providers/share_provider.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../details_zekr_view_model.dart';

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
      color: Provider.of<ShareProvider>(context).isDark
          ? Theme.of(context).hintColor
          : null,
      child: SizedBox(
        width: double.infinity,
        height: 90.h,
        child: Consumer<DetailsZekrViewModel>(
          builder: (context, provider, _) => Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    SnackBar snackBar = SnackBar(
                      content: AutoSizeText(
                        viewModel.snakBarTitle,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: ColorManager.white,
                            ),
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: ColorManager.primary,
                    );
                    Clipboard.setData(
                      ClipboardData(
                        text: provider.azkar[provider.pageIndex].description,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: CircularPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  animationDuration: 300,
                  radius: 40.0.r,
                  lineWidth: 6.0.w,
                  percent: provider.progress.clamp(0.0, 1.0),
                  center: Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p5),
                    child: AutoSizeText(
                      "${provider.start}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  progressColor: ColorManager.primary,
                  backgroundColor: ColorManager.grey,
                ),
              ),
              Expanded(
                flex: 1,
                child: AutoSizeText(
                  provider.azkar[provider.pageIndex].number,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
