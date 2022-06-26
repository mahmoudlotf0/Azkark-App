import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/resources/constants_manager.dart';
import 'package:azkarapp/presentation/resources/values_manager.dart';

import '../details_zekr_view_model.dart';

class DisplayZekr extends StatelessWidget {
  const DisplayZekr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<DetailsZekrViewModel>(
        builder: (_, provider, __) => PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: provider.pageController,
          reverse: true,
          onPageChanged: (int currentIndex) {
            provider.onPageChange(currentIndex);
          },
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p5,
                top: AppPadding.p5,
              ),
              child: Material(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius.r),
                elevation: AppConstants.elevation,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p5.w,
                    vertical: AppPadding.p5.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppMargin.m10.w,
                    vertical: AppMargin.m10.h,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      provider.onPressedZekr(provider.azkar[index]);
                    },
                    child: AutoSizeText(
                      provider.azkar[index].description,
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: provider.azkar.length,
        ),
      ),
    );
  }
}
