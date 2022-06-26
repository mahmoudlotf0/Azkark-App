import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/resources/color_manager.dart';
import 'package:azkarapp/presentation/resources/constants_manager.dart';
import 'package:azkarapp/presentation/resources/values_manager.dart';

import '../azkar_view_model.dart';

class SearchBar extends StatelessWidget {
  final AzkarViewModel viewModel;

  const SearchBar({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AzkarViewModel>(
      builder: (_, provider, __) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10.w,
          vertical: AppPadding.p5.h,
        ),
        width: double.infinity,
        child: TextFormField(
          onFieldSubmitted: (value) {
            provider.onChangeSearch(value);
          },
          onChanged: (String value) {
            provider.onChangeSearch(value);
          },
          onTap: () {
            provider.changeIsSearch(true);
          },
          controller: provider.controller,
          autofocus: false,
          textAlign: TextAlign.end,
          textDirection: TextDirection.ltr,
          cursorColor: ColorManager.primary,
          cursorWidth: 1.0.w,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.ltr,
            suffixIcon: Icon(
              Icons.search,
              size: AppSize.s20.r,
            ),
            prefixIcon: provider.isSearch && provider.controller.text.isNotEmpty
                ? IconButton(
                    onPressed: provider.deleteSearchText,
                    icon: Icon(
                      Icons.clear,
                      size: AppSize.s20.r,
                    ),
                  )
                : const SizedBox(),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.none,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            hintText: viewModel.hintInSearchBar,
          ),
        ),
      ),
    );
  }
}
