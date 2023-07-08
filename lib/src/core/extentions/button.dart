import 'package:flutter/material.dart'
    show
        BorderSide,
        BorderStyle,
        ButtonStyle,
        EdgeInsets,
        MaterialStatePropertyAll,
        OutlinedButtonThemeData;

import '../../config/themes/colors.dart';

extension OutlineButtonStyle on OutlinedButtonThemeData {
  ButtonStyle? outline() {
    return style?.copyWith(
      side: const MaterialStatePropertyAll(
        BorderSide(
          width: 1.0,
          style: BorderStyle.solid,
          color: AppColors.secondary,
        ),
      ),
    );
  }

  ButtonStyle? outlineDisabled() {
    return style?.copyWith(
      side: const MaterialStatePropertyAll(
        BorderSide(
          width: 1.0,
          style: BorderStyle.solid,
          color: AppColors.greyLight,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(
        AppColors.greyLight,
      ),
    );
  }

  ButtonStyle? icon() {
    return outline()?.copyWith(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
