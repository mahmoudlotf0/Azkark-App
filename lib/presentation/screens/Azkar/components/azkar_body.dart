import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../main_data.dart';
import '../../../resources/values_manager.dart';
import '../azkar_view_model.dart';
import 'search_bar.dart';
import 'show_categories_data.dart';

class AzkarBody extends StatelessWidget {
  final AzkarViewModel viewModel;
  const AzkarBody({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(viewModel: viewModel),
        Consumer<AzkarViewModel>(
          builder: (_, provider, __) => Expanded(
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.isSearch
                    ? provider.searchedForCategory.length
                    : categoriesData.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  crossAxisSpacing: AppPadding.p10.r,
                  mainAxisSpacing: AppPadding.p10.r,
                  childAspectRatio: 3 / 2,
                ),
                padding: EdgeInsets.all(AppPadding.p10.r),
                itemBuilder: (context, index) {
                  return ShowCategoriesData(
                    category: provider.isSearch
                        ? provider.searchedForCategory[index]
                        : categoriesData[index],
                    viewModel: viewModel,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
