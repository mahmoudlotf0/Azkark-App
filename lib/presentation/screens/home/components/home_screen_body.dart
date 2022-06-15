import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main_data.dart';
import '../../../../models/categories.dart';
import '../../../resources/values_manager.dart';
import '../home_view_model.dart';
import 'categories_data.dart';

class HomeScreenBody extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreenBody({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 10.r,
            childAspectRatio: 3 / 2,
            padding: EdgeInsets.all(AppPadding.p10.r),
            children: categories.map((Category category) {
              return CategoriesData(category: category, viewModel: viewModel);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
