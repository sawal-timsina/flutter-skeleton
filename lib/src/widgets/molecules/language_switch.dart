import 'package:flutter/material.dart'
    show BuildContext, Overlay, OverlayEntry, SizedBox, StatelessWidget, Widget;

import '../../../config.dart' show Config;
import '../../core/enums/enums.dart';
import 'language_settings.dart' show LanguageSettings;

class LanguageSwitch extends StatelessWidget {
  final Widget child;

  const LanguageSwitch({super.key, this.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (_) => child),
        if (Config.flavour == Flavour.development)
          OverlayEntry(builder: (_) => const LanguageSettings()),
      ],
    );
  }
}
