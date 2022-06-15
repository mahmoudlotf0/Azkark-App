import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import 'components/home_screen_body.dart';
import 'home_view_model.dart';

class Home extends StatelessWidget {
  final HomeViewModel viewModel;
  const Home({required this.viewModel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: HomeScreenBody(viewModel: viewModel),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return appBarWidget(
      title: AutoSizeText(
        viewModel.titleAppBar,
        style: getBoldStyle(
          color: ColorManager.black,
          fontsize: FontSize.s20,
        ),
      ),
      actions: [
        _buildSearchIcon(context),
        _buildsettingsIcon(context),
      ],
      height: AppSize.s40,
    );
  }

  Widget _buildsettingsIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        viewModel.onPressedSettingsIcon(context);
      },
      icon: const Icon(Icons.settings),
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        // viewModel.onPressedSearchIcon(context);
      },
      icon: const Icon(Icons.search),
    );
  }
}
