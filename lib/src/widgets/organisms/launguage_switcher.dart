import 'dart:ui';

import "package:easy_localization/easy_localization.dart";
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        FloatingActionButton,
        StatelessWidget,
        Text,
        Theme,
        Widget;

import '../../core/utils/constants.dart' show AppLocale;

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: context.locale == AppLocale.ja
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
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
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
