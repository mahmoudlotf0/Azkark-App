import 'package:auto_size_text/auto_size_text.dart';
import '../../details_zekr/details_zekr_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/categories.dart';
import '../../../resources/constants_manager.dart';
import '../azkar_view_model.dart';

class ShowCategoriesData extends StatelessWidget {
  final AzkarViewModel viewModel;
  final Category category;

  const ShowCategoriesData({
    required this.category,
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsZekrViewModel detailsViewModel =
        DetailsZekrViewModel.getObject(context);
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
          margin: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          ),
          child: Center(
            child: AutoSizeText(
              category.title,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
