import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config.dart';
import 'src/app.dart';
import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      useOnlyLangCode: true,
      startLocale: const Locale(Config.locale),
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      child: App(),
    ),
  );
}
