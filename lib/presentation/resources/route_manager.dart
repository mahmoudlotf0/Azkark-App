import '../screens/Azkar/azkar.dart';
import '../screens/Azkar/azkar_view_model.dart';
import '../screens/details_sebha/details_sebha.dart';
import '../screens/details_zekr/details_zekr.dart';
import '../screens/details_zekr/details_zekr_view_model.dart';
import '../screens/settings/settings.dart';
import '../screens/settings/settings_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/categories.dart';

class Routes {
  static const String azkarScreen = '/';
  static const String detailsZekrScreen = 'detailsZekrScreen';
  static const String settingsScreen = 'settingsScreen';
  static const String detailsSebha = 'detailsSebha';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings settings) {
    AzkarViewModel homeViewModel = AzkarViewModel();
    DetailsZekrViewModel detailsViewModel = DetailsZekrViewModel();

    switch (settings.name) {
      case Routes.azkarScreen:
        return MaterialPageRoute(
          builder: (_) => Azkar(viewModel: homeViewModel),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
            builder: (_) => Settings(
                  viewModel: SettingViewModel(),
                ));
      case Routes.detailsZekrScreen:
        return MaterialPageRoute(
          builder: (context) {
            final Category routeArgument = settings.arguments as Category;
            detailsViewModel.category = routeArgument;
            return DetailsZekr(viewModel: detailsViewModel);
          },
        );
      case Routes.detailsSebha:
        return MaterialPageRoute(builder: (context) {
          final arguments = settings.arguments as Map;
          final String title = arguments['title'];
          final int value = arguments['value'];

          return DetailsSebha(
            title: title,
            value: value,
          );
        });
    }
    return null;
  }
}
