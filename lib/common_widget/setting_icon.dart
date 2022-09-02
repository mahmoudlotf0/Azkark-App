import '../presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.settingsScreen);
      },
      icon: const Icon(Icons.settings),
    );
  }
}
