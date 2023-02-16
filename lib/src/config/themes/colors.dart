import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE0F0ED),
    100: Color(0xFFB3DAD3),
    200: Color(0xFF80C1B6),
    300: Color(0xFF4DA898),
    400: Color(0xFF269582),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF007A64),
    700: Color(0xFF006F59),
    800: Color(0xFF00654F),
    900: Color(0xFF00523D),
  });
  static const int _primaryPrimaryValue = 0xFF00826C;
  static const Color black = Color(0xFF333333);
  static const Color greyDark = Color(0xFF999999);
  static const Color greyLight = Color(0xFFF3F4F8);
  static const Color secondary = Color(0xFF097693);
  static const Color warning = Color(0xFFBD5D06);
  static const Color error = Color(0xFFA40E15);
}
