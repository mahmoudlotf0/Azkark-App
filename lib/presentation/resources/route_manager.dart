import '../../models/sebha.dart';
import '../screens/Azkar/azkar.dart';
import '../screens/Azkar/azkar_view_model.dart';
import '../screens/details_sebha/details_sebha.dart';
import '../screens/details_sebha/details_sebha_view_model.dart';
import '../screens/details_zekr/details_zekr.dart';
import '../screens/details_zekr/details_zekr_view_model.dart';
import '../screens/settings/settings.dart';
import '../screens/settings/settings_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/categories.dart';

class Routes {
  static const String homeScreen = '/';
  static const String detailsScreen = 'detailsScreen';
  static const String settingsScreen = 'settingsScreen';
  static const String detailsSebha = 'detailsSebha';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings settings) {
    AzkarViewModel homeViewModel = AzkarViewModel();
    DetailsZekrViewModel detailsViewModel = DetailsZekrViewModel();
    DetailsSebhaViewModel detailsSebhaViewModel = DetailsSebhaViewModel();
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
      case Routes.detailsSebha:
        return MaterialPageRoute(builder: (context) {
          final SebhaModel sebhaModel = settings.arguments as SebhaModel;
          detailsSebhaViewModel.sebhaModel = sebhaModel;
          return DetailsSebha(
            viewModel: detailsSebhaViewModel,
          );
        });
    }
    return null;
  }
}
