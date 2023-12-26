import 'package:flutter/material.dart'
    show BuildContext, Overlay, OverlayEntry, SizedBox, StatelessWidget, Widget;

import '../../../config.dart' show Config;
import '../../core/utils/constants.dart' show Flavour;
import 'language_settings.dart' show LanguageSettings;

class LanguageSwitch extends StatelessWidget {
  final Widget? child;

  const LanguageSwitch({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (_) => child ?? const SizedBox()),
        if (Config.flavour == Flavour.development)
          OverlayEntry(builder: (_) => const LanguageSettings()),
      ],
    );
  }
}
