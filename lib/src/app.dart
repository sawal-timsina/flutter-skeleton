import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
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
        Provider<AppRouter>(create: (context) => AppRouter(context))
      ],
      builder: (context, child) {
        return Sizer(builder: (_, orientation, deviceType) {
          return MaterialApp.router(
            locale: context.locale,
            debugShowCheckedModeBanner: kDebugMode,
            routerConfig: _.read<AppRouter>().router,
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
                  OverlayEntry(builder: (_) => const AppSettings()),
                ],
              );
            },
          );
        });
      },
    );
  }
}
