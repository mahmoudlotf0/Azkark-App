import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/setting_icon.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../../main_data.dart';
import '../../resources/values_manager.dart';
import 'azkar_view_model.dart';
import 'components/search_bar.dart';
import 'components/show_categories_data.dart';

class Azkar extends StatelessWidget {
  final AzkarViewModel viewModel;
  const Azkar({required this.viewModel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
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
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return appBarWidget(
      title: viewModel.titleAppBar,
      actions: [const SettingsIcon()],
    );
  }
}
