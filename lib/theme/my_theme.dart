import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    //icons in text feild
    accentColor: Colors.black,
    // background in all app , grid view
    scaffoldBackgroundColor: Colors.white,
    // container , grid view
    canvasColor: Colors.white,
    // circle progrees , indicator color
    primaryColor: Color(0xFF7D0633),
    //Cursor Style
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    //TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Colors.grey[300],
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[300],
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      // Category , app bar , main text
      headline1: GoogleFonts.changa(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      // number in circle Indicator
      headline2: GoogleFonts.changa(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      //text in snak bar
      headline3: GoogleFonts.changa(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      // input in text filed in search
      subtitle1: GoogleFonts.changa(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    //icons in text feild
    accentColor: Colors.white,
    // background in all app , grid view
    scaffoldBackgroundColor: Color(0xFF333739),
    // container , grid view
    canvasColor: Color(0xFF333739),
    // circle progrees , indicator color
    primaryColor: Color(0xFF7D0633),
    //Cursor Style
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    //TextFormField
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Colors.grey[700],
    ),

    appBarTheme: AppBarTheme(
      color: Color(0xFF333739),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF333739),
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      // Category , app bar , main text
      headline1: GoogleFonts.changa(
        color: Color(0xFFe8eaed),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      // number in circle Indicator
      headline2: GoogleFonts.changa(
        color: Color(0xFFe8eaed),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      // Text in snakBar
      headline3: GoogleFonts.changa(
        color: Color(0xFFe8eaed),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: GoogleFonts.changa(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
