import 'package:azkarapp/presentation/screens/Azkar/azkar.dart';
import 'package:azkarapp/presentation/screens/Azkar/azkar_view_model.dart';
import 'package:azkarapp/presentation/screens/details_zekr/details_zekr.dart';
import 'package:azkarapp/presentation/screens/details_zekr/details_zekr_view_model.dart';
import 'package:azkarapp/presentation/screens/settings/settings.dart';
import 'package:azkarapp/presentation/screens/settings/settings_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/categories.dart';

class Routes {
  static const String homeScreen = '/';
  static const String detailsScreen = 'detailsScreen';
  static const String settingsScreen = 'settingsScreen';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings settings) {
    AzkarViewModel homeViewModel = AzkarViewModel();
    DetailsZekrViewModel detailsViewModel = DetailsZekrViewModel();

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => Azkar(viewModel: homeViewModel),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
            builder: (_) => Settings(
                  viewModel: SettingViewModel(),
                ));
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final Category routeArgument = settings.arguments as Category;
            detailsViewModel.category = routeArgument;
            return DetailsZekr(viewModel: detailsViewModel);
          },
        );
    }
  }
}
