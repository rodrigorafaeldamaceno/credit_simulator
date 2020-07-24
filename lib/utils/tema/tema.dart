import 'package:flutter/material.dart';

class Tema {
  static Color corPrincipal = Colors.blue;
  static Color corSecundaria = Colors.green;
  static Color fundo = Color.fromRGBO(250, 250, 250, 1);

  static Color colorFromHex(String hexColor) {
    if (hexColor == '#FFFFFF' || hexColor == "") hexColor = '0D47A1';
    final hexCode = hexColor.replaceAll('#', '');

    return Color(int.parse('FF$hexCode', radix: 16)).withOpacity(1);
  }

  static Color colorFromRGB(String rbgColor) {
    if (rbgColor == '255,255,255') return colorFromHex('0D47A1');

    int red = int.parse(rbgColor.split(',')[0]);
    int green = int.parse(rbgColor.split(',')[1]);
    int blue = int.parse(rbgColor.split(',')[2]);

    return Color.fromRGBO(red, green, blue, 1);
  }
}
