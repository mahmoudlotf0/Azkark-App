import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/zekrtype.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class DisplayZekr extends StatelessWidget {
  final Zekr zekr;
  const DisplayZekr({required this.zekr, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Material(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
        elevation: AppConstants.elevation,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p5.w,
            vertical: AppPadding.p5.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m10.w,
            vertical: AppMargin.m10.h,
          ),
          child: SingleChildScrollView(
            child: AutoSizeText(
              zekr.description,
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: getSemiBoldStyle(
                color: ColorManager.black,
                fontsize: FontSize.s20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
