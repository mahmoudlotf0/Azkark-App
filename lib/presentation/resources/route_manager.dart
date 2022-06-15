import 'package:flutter/material.dart';

import '../../models/categories.dart';
import '../screens/details/details.dart';
import '../screens/details/details_view_model.dart';
import '../screens/home/home.dart';
import '../screens/home/home_view_model.dart';

class Routes {
  static const String homeScreen = '/';
  static const String detailsScreen = 'detailsScreen';
  static const String settingsScreen = 'settingsScreen';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings settings) {
    HomeViewModel homeViewModel = HomeViewModel();
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => Home(viewModel: homeViewModel),
        );
      // case Routes.settingsScreen:
      //   return MaterialPageRoute(builder: (_) => SettingsScreen());
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            DetailsViewModel viewModel = DetailsViewModel.getObject(context);
            final Category routeArgument = settings.arguments as Category;
            viewModel.category = routeArgument;
            return Details(viewModel: viewModel);
          },
        );
    }
  }
}
