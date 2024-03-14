import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          background: AppColors.black,
          brightness: Brightness.dark,
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,
          error: AppColors.error,
          onError: Colors.white,
          onBackground: Colors.black87,
          surface: AppColors.white,
          onSurface: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll<TextStyle>(
              AppTextStyles.labelLarge,
            ),
            foregroundColor: const MaterialStatePropertyAll<Color>(
              AppColors.white,
            ),
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return states.contains(MaterialState.disabled)
                  ? AppColors.greyDark
                  : AppColors.secondary;
            }),
          ),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: AppTextStyles.appBarStyle,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: AppTextStyles.bodyLarge,
          floatingLabelStyle: AppTextStyles.bodyLarge,
          hintStyle: AppTextStyles.hintStyle,
          counterStyle: AppTextStyles.hintStyle,
          errorStyle: AppTextStyles.errorStyle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.greyDark, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.greyDark, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.secondary, width: 1),
          ),
        ),
      );
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          background: AppColors.white,
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,
          error: AppColors.error,
          onError: Colors.white,
          onBackground: Colors.black87,
          surface: AppColors.white,
          onSurface: Colors.grey,
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondary,
          titleTextStyle: AppTextStyles.appBarStyle,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          surfaceTintColor: AppColors.white,
          headerBackgroundColor: AppColors.primary,
          headerForegroundColor: AppColors.white,
          headerHelpStyle: AppTextStyles.dpHeaderHelpStyle,
          weekdayStyle: AppTextStyles.bodySmall,
          dayStyle: AppTextStyles.labelMedium,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: AppTextStyles.bodyLarge,
          floatingLabelStyle: AppTextStyles.bodyLarge,
          hintStyle: AppTextStyles.hintStyle,
          counterStyle: AppTextStyles.hintStyle,
          errorStyle: AppTextStyles.errorStyle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.greyDark, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.greyDark, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.secondary, width: 1),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll<TextStyle>(
              AppTextStyles.labelLarge,
            ),
            foregroundColor: const MaterialStatePropertyAll<Color>(
              AppColors.white,
            ),
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size.fromHeight(50)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return states.contains(MaterialState.disabled)
                  ? AppColors.greyDark
                  : AppColors.secondary;
            }),
          ),
        ),
        dividerColor: AppColors.greyDark,
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          displaySmall: AppTextStyles.displaySmall,
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.labelSmall,
        ),
      );
}
