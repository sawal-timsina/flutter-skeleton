import 'package:flutter/material.dart' show Color, Colors, MaterialColor;

class AppColors {
  static const MaterialColor primary = MaterialColor(0xFF2196F3, <int, Color>{
    50: Color(0xFFE0F2F8),
    100: Color(0xFFB3E5FC),
    200: Color(0xFF81D4FA),
    300: Color(0xFF4FC3F7),
    400: Color(0xFF29B6F6),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });
  static const Color black = Color(0xFF333333);
  static const Color greyDark = Color(0xFF999999);
  static const Color greyLight = Color(0xFFF3F4F8);
  static const Color secondary = Colors.pinkAccent;
  static const Color warning = Color(0xFFBD5D06);
  static const Color error = Color(0xFFA40E15);
}
