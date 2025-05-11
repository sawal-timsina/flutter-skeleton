import "package:easy_localization/easy_localization.dart";
import 'package:flutter/material.dart'
    show BuildContext, FloatingActionButton, StatelessWidget, Text, Widget;

import '../../core/extensions/context.dart';
import '../../core/utils/constants.dart' show AppLocale;

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor:
          context.locale == AppLocale.ja ? context.primary : context.secondary,
      onPressed: () {
        context.locale == AppLocale.ja
            ? context.setLocale(AppLocale.en)
            : context.setLocale(AppLocale.ja);
      },
      child: Text(
        (context.locale == AppLocale.en
                ? AppLocale.en.languageCode
                : AppLocale.ja.languageCode)
            .toUpperCase(),
        style: context.languageButtonStyle,
      ),
    );
  }
}
