import 'package:flutter/material.dart';

class ColorManager {
  static Color white = HexColor.fromHex('#F6FBF4');
  static Color black = HexColor.fromHex('#333739');
  static Color primary = HexColor.fromHex('#7D0633');
  static Color darkGrey = HexColor.fromHex('#7F8487');
  static Color lightGrey = HexColor.fromHex('#EEEEEE');
  static Color grey = HexColor.fromHex('#FFBDBDBD');
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
