import 'package:flutter/material.dart';

class ColorManager {
  static Color white = HexColor.fromHex('#F6FBF4');
  static Color black = HexColor.fromHex('#333739');
  static Color darkRed = HexColor.fromHex('#7D0633');
  static Color lightGrey = HexColor.fromHex('#E0E0E0');
  static Color darkGrey = HexColor.fromHex('#616161');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
