import 'package:easy_localization/easy_localization.dart'
    show BuildContextEasyLocalizationExtension, tr;
import 'package:flutter/foundation.dart' show Key, Listenable, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderLocalizations;
import 'package:sizer/sizer.dart' show Sizer;

import 'config/index.dart' show AppRouter, AppTheme;
import 'core/utils/app_strings.dart';
import 'providers/index.dart';
import 'widgets/molecules/language_switch.dart';

final mainNavigator = GlobalKey<NavigatorState>();

class App extends ConsumerWidget {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return Sizer(
      builder: (_, orientation, deviceType) {
        return MaterialApp.router(
          locale: context.locale,
          debugShowCheckedModeBanner: kDebugMode,
          routerConfig: AppRouter(
            ref: ref,
            refreshListenable: Listenable.merge(
              [
                ref.read(authProvider),
                ref.read(onBoardingProvider),
              ],
            ),
          ),
          title: tr(defaultAppTitle),
          theme: isDarkMode ? AppTheme.dark : AppTheme.light,
          localizationsDelegates: [
            FormBuilderLocalizations.delegate,
            ...context.localizationDelegates,
          ],
          supportedLocales: context.supportedLocales,
          builder: (context, child) => LanguageSwitch(child: child!),
        );
      },
    );
  }
}
