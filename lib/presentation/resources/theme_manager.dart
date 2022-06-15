import 'color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    //? background in all app , grid view
    scaffoldBackgroundColor: ColorManager.white,
    //? container , grid view
    canvasColor: ColorManager.white,
    //? circle progrees , indicator color
    primaryColor: ColorManager.darkRed,
    //? Cursor Style
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.black,
    ),
    //? TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: ColorManager.black,
        fontSize: 20.sp,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: ColorManager.lightGrey,
    ),
    //? AppBar
    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.lightGrey,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.black,
      ),
      iconTheme: IconThemeData(color: ColorManager.black),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    //? icons in text feild
    // colorScheme: lightTheme.colorScheme.copyWith(secondary: ColorManager.white),
    //? background in all app , grid view
    scaffoldBackgroundColor: ColorManager.black,
    //? container , grid view
    canvasColor: ColorManager.black,
    //? circle progrees , indicator color
    primaryColor: ColorManager.darkRed,
    //? Cursor Style
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.black,
    ),
    //? TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: ColorManager.white,
        fontSize: 20.sp,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: ColorManager.darkGrey,
    ),
    appBarTheme: AppBarTheme(
      color: ColorManager.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.black,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: ColorManager.black),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
  );
}
