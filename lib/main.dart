import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config.dart';
import 'src/app.dart';
import 'src/core/utils/constants.dart';
import 'src/injector.dart';

void main() async {
  // GitHooks.init(targetPath: 'bin/git_hooks.dart');
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        useOnlyLangCode: true,
        startLocale: const Locale(Config.locale),
        supportedLocales: AppLocale.locales,
        child: const App(),
      ),
    ),
  );
}
