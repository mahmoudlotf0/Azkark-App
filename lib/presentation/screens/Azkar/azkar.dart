import 'package:flutter/material.dart';

import '../../../common_widget/appbar_widget.dart';
import 'components/azkar_body.dart';
import 'azkar_view_model.dart';

class Azkar extends StatelessWidget {
  final AzkarViewModel viewModel;
  const Azkar({required this.viewModel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: AzkarBody(viewModel: viewModel),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return appBarWidget(
      title: viewModel.titleAppBar,
      actions: [
        _buildsettingsIcon(context),
      ],
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
}
