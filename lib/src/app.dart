import 'package:easy_localization/easy_localization.dart'
    show BuildContextEasyLocalizationExtension, tr;
import 'package:flutter/foundation.dart' show Key, Listenable, kDebugMode;
import 'package:flutter/material.dart'
    show
        BuildContext,
        FocusManager,
        Key,
        MaterialApp,
        Overlay,
        OverlayEntry,
        StatelessWidget,
        Widget;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderLocalizations;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, ReadContext;
import 'package:sizer/sizer.dart' show Sizer;

import '../config.dart';
import 'config/router/app_router.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/constants.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/organisms/app_settings.dart';

class App extends StatelessWidget {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      builder: (context, child) {
        return Sizer(
          builder: (_, orientation, deviceType) {
            return MaterialApp.router(
              locale: context.locale,
              debugShowCheckedModeBanner: kDebugMode,
              routerConfig: AppRouter(
                refreshListenable: Listenable.merge([
                  _.read<AuthProvider>(),
                  _.read<OnboardingProvider>(),
                ]),
              ),
              title: tr("Skeleton"),
              theme: AppTheme.light,
              localizationsDelegates: [
                FormBuilderLocalizations.delegate,
                ...context.localizationDelegates
              ],
              supportedLocales: context.supportedLocales,
              builder: (context, child) {
                return Overlay(
                  initialEntries: [
                    OverlayEntry(builder: (_) => child!),
                    if (Config.flavour == Flavour.development)
                      OverlayEntry(builder: (_) => const AppSettings()),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
