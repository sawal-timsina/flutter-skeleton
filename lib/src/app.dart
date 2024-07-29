import 'package:easy_localization/easy_localization.dart'
    show BuildContextEasyLocalizationExtension, tr;
import 'package:flutter/foundation.dart' show Key, Listenable, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerState, ConsumerStatefulWidget, ConsumerWidget, WidgetRef;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderLocalizations;
import 'package:sizer/sizer.dart' show Sizer;

import 'config/router/app_router.dart';
import 'config/themes/app_theme.dart';
import 'core/version_updator.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/molecules/language_switch.dart';

final mainNavigator = GlobalKey<NavigatorState>();

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    versionUpdater();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      versionUpdater();
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Sizer(
      builder: (_, orientation, deviceType) {
        return MaterialApp.router(
          locale: context.locale,
          debugShowCheckedModeBanner: kDebugMode,
          routerConfig: AppRouter(
            ref: ref,
            refreshListenable: Listenable.merge(
              [ref.read(authProvider), ref.read(onBoardingProvider)],
            ),
          ),
          title: tr("Skeleton"),
          theme: AppTheme.light,
          localizationsDelegates: [
            FormBuilderLocalizations.delegate,
            ...context.localizationDelegates,
          ],
          supportedLocales: context.supportedLocales,
          builder: (context, child) => LanguageSwitch(child: child),
        );
      },
    );
  }
}
