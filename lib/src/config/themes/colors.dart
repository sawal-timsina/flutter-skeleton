import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary =
      MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color(0xFFE7F4E3),
    100: Color(0xFFC3E4B8),
    200: Color(0xFF9CD289),
    300: Color(0xFF74BF59),
    400: Color(0xFF56B236),
    500: Color(_greenPrimaryValue),
    600: Color(0xFF329C10),
    700: Color(0xFF2B920D),
    800: Color(0xFF24890A),
    900: Color(0xFF177805),
  });
  static const int _greenPrimaryValue = 0xFF38A412;
  static const Color black = Color(0xFF333333);
  static const Color greyDark = Color(0xFF999999);
  static const Color greyLight = Color(0xFFF3F4F8);
  static const Color secondary = Color(0xFFF05158);
}
