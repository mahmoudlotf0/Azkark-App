import 'font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, String fontFamily, Color color,
    {double letterSpacing = 0}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}

TextStyle getRegularStyle(
    {double fontsize = FontSize.s16, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.regular,
    FontConstants.fontFamiltyTajawal,
    color,
  );
}

TextStyle getBoldStyle({double fontsize = FontSize.s16, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.bold,
    FontConstants.fontFamiltyTajawal,
    color,
  );
}

TextStyle getSemiBoldStyle(
    {double fontsize = FontSize.s16, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.semiBold,
    FontConstants.fontFamiltyTajawal,
    color,
  );
}
