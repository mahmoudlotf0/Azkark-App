import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';

import 'package:azkarapp/Screens/settings/contents/dark_mode.dart';
import 'package:azkarapp/Screens/settings/settings.dart';
import 'package:azkarapp/theme/my_theme.dart';
import 'package:azkarapp/theme/theme_services.dart';

import './Screens/page_view_screen.dart';
import 'Screens/main_screen.dart';
import 'my_widgets/common_widget/advanced_search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // Stop Orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Main Mode
      themeMode: ThemeServices().theme,
      // Light Mode
      theme: MyTheme.lightTheme,
      // Dark Mode
      darkTheme: MyTheme.darkTheme,
      home: MyHomePage(),
      ///////////////////////
      onGenerateRoute: (settings) {
        if (settings.name == PageViewScreen.routeName) {
          return PageTransition(
            child: PageViewScreen(),
            type: PageTransitionType.bottomToTop,
            settings: settings,
          );
        } else if (settings.name == Settings.routeName) {
          return PageTransition(
            child: Settings(),
            type: PageTransitionType.rightToLeft,
            settings: settings,
          );
        } else if (settings.name == DarkMode.routeName) {
          return PageTransition(
            child: DarkMode(),
            type: PageTransitionType.rightToLeft,
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('الرئيسية', style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: AdvancedSearch());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Settings.routeName,
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
      body: MainScreen(),
    );
  }
}
