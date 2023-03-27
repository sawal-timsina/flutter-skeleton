import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static const TextStyle _displayLarge = TextStyle(
    color: AppColors.black,
    height: 40 / 25,
    fontSize: 25.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle _displayMedium = TextStyle(
    color: AppColors.black,
    height: 34 / 23.0,
    fontSize: 23.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle _bodyMedium = TextStyle(
    color: AppColors.black,
    height: 30 / 19.0,
    fontSize: 19.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle _bodyLarge = TextStyle(
    color: AppColors.black,
    height: 34 / 19.0,
    fontSize: 19.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle _labelLarge = TextStyle(
    color: AppColors.black,
    height: 20.0 / 19,
    fontSize: 19.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static ThemeData get light {
    ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.black26,
      colorScheme: const ColorScheme(
        background: Colors.black87,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        onBackground: Colors.black87,
        surface: Colors.white,
        onSurface: Colors.grey,
      ),
      textTheme: const TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        labelLarge: _labelLarge,
      ),
    );
    themeData = themeData.copyWith(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        labelStyle: _bodyLarge,
        floatingLabelStyle: _bodyLarge,
        hintStyle: _labelLarge.copyWith(
          color: AppColors.greyDark,
          fontWeight: FontWeight.w400,
        ),
        counterStyle: _bodyMedium.copyWith(
          color: AppColors.greyDark,
        ),
        errorStyle: _bodyMedium.copyWith(color: Colors.red),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyDark, width: 1),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.greyDark, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.secondary, width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        shadowColor: Colors.transparent,
        backgroundColor: themeData.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: _labelLarge.copyWith(fontSize: 22, color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        selectedLabelStyle: _bodyLarge,
        unselectedLabelStyle: _bodyMedium,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          textStyle: _labelLarge,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: themeData.colorScheme.secondary,
          disabledForegroundColor: AppColors.greyDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          textStyle: _labelLarge,
          elevation: 0,
          backgroundColor: themeData.colorScheme.secondary,
          disabledBackgroundColor: AppColors.greyLight,
          disabledForegroundColor: AppColors.greyDark,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          textStyle: _labelLarge,
          elevation: 0,
          foregroundColor: themeData.colorScheme.secondary,
          disabledForegroundColor: AppColors.greyDark,
        ),
      ),
    );
    return themeData;
  }
}
