import 'package:flutter/material.dart';

import '../../../models/categories.dart';
import '../../resources/route_manager.dart';

class HomeViewModel {
  final String titleAppBar = 'الرئيسية';
  late Category category;

  void onPressedCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      Routes.detailsScreen,
      arguments: category,
    );
  }

  void onPressedSettingsIcon(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.settingsScreen);
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
