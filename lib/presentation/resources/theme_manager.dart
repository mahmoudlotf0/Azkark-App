import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'style_manager.dart';
import 'values_manager.dart';

import 'color_manager.dart';
import 'constants_manager.dart';
import 'font_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    hintColor: ColorManager.lightGrey,
    //*  background in all app
    scaffoldBackgroundColor: ColorManager.white,
    //*  container , grid view
    canvasColor: ColorManager.white,
    //*  circle progrees , indicator color
    primaryColor: ColorManager.primary,
    //*  TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getBoldStyle(color: ColorManager.black),
      filled: true,
      fillColor: ColorManager.lightGrey,
      iconColor: ColorManager.primary,
      contentPadding: EdgeInsets.all(AppPadding.p5.r),
    ),
    textTheme: TextTheme(
      //* text input in text field
      subtitle1: getBoldStyle(color: ColorManager.black),
      headline1: getBoldStyle(
        color: ColorManager.black,
        fontsize: FontSize.s22,
      ),
      headline2: getBoldStyle(
        color: ColorManager.black,
        fontsize: FontSize.s20,
      ),
      headline3: getBoldStyle(
        color: ColorManager.black,
        fontsize: FontSize.s25,
      ),
      bodyText1: getBoldStyle(
        color: ColorManager.black,
        fontsize: FontSize.s14,
      ),
    ),
    //*  AppBar
    appBarTheme: AppBarTheme(
      toolbarHeight: AppSize.s45,
      centerTitle: true,
      color: ColorManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: ColorManager.black),
      titleTextStyle: getBoldStyle(
        color: ColorManager.black,
        fontsize: FontSize.s20,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
    dividerColor: ColorManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppConstants.elevation,
      backgroundColor: ColorManager.lightGrey,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.black,
      type: BottomNavigationBarType.fixed,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    hintColor: ColorManager.darkGrey,

    //*  background in all app
    scaffoldBackgroundColor: ColorManager.black,
    //*  container , grid view
    canvasColor: ColorManager.black,
    //*  circle progrees , indicator color
    primaryColor: ColorManager.primary,
    //*  TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getBoldStyle(color: ColorManager.white),
      filled: true,
      fillColor: ColorManager.darkGrey,
      iconColor: ColorManager.primary,
      contentPadding: EdgeInsets.all(AppPadding.p5.r),
    ),
    textTheme: TextTheme(
      //* text input in text field
      subtitle1: getBoldStyle(color: ColorManager.white),
      headline1: getBoldStyle(
        color: ColorManager.white,
        fontsize: FontSize.s20,
      ),
      headline2: getBoldStyle(
        color: ColorManager.white,
        fontsize: FontSize.s18,
      ),
      headline3: getBoldStyle(
        color: ColorManager.white,
        fontsize: FontSize.s25,
      ),
      bodyText1: getBoldStyle(
        color: ColorManager.white,
        fontsize: FontSize.s14,
      ),
    ),
    //*  AppBar
    appBarTheme: AppBarTheme(
      toolbarHeight: AppSize.s45,
      centerTitle: true,
      color: ColorManager.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.black,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: ColorManager.white),
      titleTextStyle: getBoldStyle(
        color: ColorManager.white,
        fontsize: FontSize.s20,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppConstants.elevation,
      backgroundColor: ColorManager.darkGrey,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.lightGrey,
      type: BottomNavigationBarType.fixed,
    ),
    dividerColor: ColorManager.lightGrey,
  );
}
