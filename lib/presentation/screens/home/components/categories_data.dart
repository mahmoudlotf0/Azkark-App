import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/categories.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';
import '../../details/details_view_model.dart';
import '../home_view_model.dart';

class CategoriesData extends StatelessWidget {
  final HomeViewModel viewModel;
  final Category category;

  const CategoriesData({
    required this.category,
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsViewModel detailsViewModel = DetailsViewModel.getObject(context);
    return GestureDetector(
      onTap: () {
        viewModel.category = category;
        detailsViewModel.category = category;
        viewModel.onPressedCategory(context);
      },
      child: Material(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
        elevation: AppConstants.elevation,
        child: Container(
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          ),
          child: Center(
            child: AutoSizeText(
              category.title,
              style: getBoldStyle(
                color: ColorManager.black,
                fontsize: FontSize.s22,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
