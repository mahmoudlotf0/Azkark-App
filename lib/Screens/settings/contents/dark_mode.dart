import 'package:azkarapp/theme/theme_services.dart';
import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  static String routeName = 'dark_mode';
  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:
            Text('الوضع المظلم', style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('تشغيل', style: Theme.of(context).textTheme.headline1),
            value: true,
            groupValue: ThemeServices().loadThemeFromBox(),
            onChanged: (bool? value) {
              // ThemeServices().switchTheme();
              ThemeServices().switchTheme();
            },
          ),
          RadioListTile(
            title: Text('إيقاف', style: Theme.of(context).textTheme.headline1),
            value: false,
            groupValue: ThemeServices().loadThemeFromBox(),
            onChanged: (bool? value) {
              // currentTheme.switchTheme();
              ThemeServices().switchTheme();
            },
          ),
        ],
      ),
    );
  }
}
