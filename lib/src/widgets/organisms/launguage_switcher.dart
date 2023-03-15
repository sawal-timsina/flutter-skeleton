import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';

class LaunguageSwitcher extends StatelessWidget {
  const LaunguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.locale.toString() == "ja"
          ? AppColors.flagColor[0]
          : AppColors.flagColor[1],
      onPressed: () {
        context.locale.toString() == "en"
            ? context.setLocale(const Locale('ja'))
            : context.setLocale(const Locale('en'));
      },
      child: Text(
        context.locale.toString() == "en" ? "EN" : "JP",
      ),
    );
  }
}
