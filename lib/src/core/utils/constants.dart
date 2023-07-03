import 'package:flutter/material.dart';

enum Flavour {
  development,
  production;
}

extension Merge on EdgeInsets {
  EdgeInsets merge(EdgeInsets? other) {
    return copyWith(
      left: other?.left != 0 ? other?.left : left,
      right: other?.right != 0 ? other?.right : right,
      top: other?.top != 0 ? other?.top : top,
      bottom: other?.bottom != 0 ? other?.bottom : bottom,
    );
  }
}

class AppLocale {
  static const Locale ja = Locale("ja");
  static const Locale en = Locale("en");
  static const locales = [ja, en];
}
