import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static TextStyle headline1 = const TextStyle(
    color: AppColors.black,
    height: 48.0 / 36.0,
    // line height calculated as is fontSize * height so, <expected-height>/<font-size>
    fontSize: 36.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle headline2Bold = const TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle heading2Regular = const TextStyle(
    color: AppColors.black,
    height: 36.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle button = const TextStyle(
    color: AppColors.black,
    height: 26.0 / 18.0,
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionBold = const TextStyle(
    color: AppColors.black,
    height: 22.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle captionRegular = const TextStyle(
    color: AppColors.black,
    height: 22.0 / 16.0,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textBold = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle textRegular = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 14.0,
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle subHeading = const TextStyle(
    color: AppColors.black,
    height: 20.0 / 12.0,
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.red,
        labelStyle: captionBold,
        floatingLabelStyle: captionBold,
        hintStyle: captionRegular.copyWith(color: AppColors.greyDark),
        counterStyle: subHeading.copyWith(
          color: AppColors.greyDark,
        ),
        errorStyle: subHeading.copyWith(color: Colors.red),
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
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: headline1,
        displayMedium: headline2Bold,
        displaySmall: heading2Regular,
        titleMedium: captionBold,
        titleSmall: captionRegular,
        bodyLarge: textBold,
        bodyMedium: textRegular,
        bodySmall: subHeading,
        labelMedium: button,
      ),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(color: AppColors.black),
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
        titleTextStyle:
            captionRegular.copyWith(fontSize: 22, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        selectedLabelStyle: captionBold,
        unselectedLabelStyle: captionRegular,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
          textStyle: MaterialStatePropertyAll(button),
          elevation: const MaterialStatePropertyAll(0),
          foregroundColor: const MaterialStatePropertyAll(AppColors.secondary),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
          textStyle: MaterialStatePropertyAll(button),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => AppColors.secondary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
          textStyle: MaterialStatePropertyAll(button),
          elevation: const MaterialStatePropertyAll(0),
          foregroundColor: const MaterialStatePropertyAll(AppColors.secondary),
        ),
      ),
    );
  }
}
