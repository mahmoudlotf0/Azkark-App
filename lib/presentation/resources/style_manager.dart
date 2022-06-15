import 'font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, String fontFamily, Color color,
    {double letterSpacing = 1.0}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}

//* Regular Style
TextStyle getRegularStyle({
  double fontsize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.regular,
    FontConstants.fontFamiltyCairo,
    color,
  );
}

TextStyle getLightStyle({
  double fontsize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.light,
    FontConstants.fontFamiltyCairo,
    color,
  );
}

TextStyle getBoldStyle({
  double fontsize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.bold,
    FontConstants.fontFamiltyCairo,
    color,
  );
}

TextStyle getSemiBoldStyle({
  double fontsize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.semiBold,
    FontConstants.fontFamiltyCairo,
    color,
  );
}

TextStyle getMeduimStyle({
  double fontsize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.meduim,
    FontConstants.fontFamiltyCairo,
    color,
  );
}
