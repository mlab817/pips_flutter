import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color blueGrey = HexColor.fromHex('#E0EFFF');
  static Color darkPrimary = HexColor.fromHex("#D17D11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#E61F34");

  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // FF stands for opacity
    }
    return Color(int.parse(hexColorString, radix: 16));
  }

  static Color fromColorName(String colorName) {
    var hexColorString = 'FF000000';
    switch (colorName) {
      case 'red':
        hexColorString = 'FFFF0000';
        break;
      case 'green':
        hexColorString = 'FF00FF00';
        break;
      case 'blue':
        hexColorString = 'FF0000FF';
        break;
      case 'orange':
        hexColorString = 'FFFFA500';
        break;
      default:
        hexColorString = 'FF00000000';
    }
    //
    return Color(int.parse(hexColorString, radix: 16));
  }
}
