import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/screens/Azkar/azkar_view_model.dart';
import 'package:azkarapp/presentation/screens/details_zekr/details_zekr_view_model.dart';

import 'common_widget/bottom_bar_widget.dart';
import 'presentation/resources/route_manager.dart';
import 'presentation/resources/theme_manager.dart';
import 'providers/share_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ShareProvider()..getIsDark()),
        ChangeNotifierProvider(create: (context) => DetailsZekrViewModel()),
        ChangeNotifierProvider(create: (context) => AzkarViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return Consumer<ShareProvider>(
          builder: (context, provider, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.isDark
                ? ThemeManager.darkTheme
                : ThemeManager.lightTheme,
            onGenerateRoute: RouteGenerator.getRoute,
            home: SafeArea(
              child: Scaffold(
                bottomNavigationBar: const BottomBarWidget(),
                body:
                    provider.screens.elementAt(provider.currentIndexBottomBar),
              ),
            ),
          ),
        );
      },
    );
  }
}
