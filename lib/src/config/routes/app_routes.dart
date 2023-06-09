import 'package:flutter/material.dart' show BuildContext, Listenable;
import 'package:go_router/go_router.dart' show GoRoute, GoRouter, GoRouterState;
import 'package:provider/provider.dart' show ReadContext;

import '../../app.dart';
import '../../core/utils/route_path.dart';
import '../../pages/demo.dart';
import '../../pages/not_found.dart';
import '../../providers/auth_provider.dart';
import '../../providers/onboarding_provider.dart';

class AppRouter {
  final BuildContext _context;
  late final GoRouter _goRouter;

  AppRouter(this._context) {
    _goRouter = GoRouter(
      navigatorKey: mainNavigator,
      refreshListenable: Listenable.merge([
        _context.read<AuthProvider>(),
        _context.read<OnboardingProvider>(),
      ]),
      initialLocation: AppPage.home.toPath,
      routes: <GoRoute>[
        GoRoute(
          path: AppPage.onboarding.toPath,
          builder: (context, state) => Demo(
            title: "Onboarding",
            args: DemoScreenArguments(AppPage.onboarding.toPath),
          ),
        ),
        GoRoute(
          path: AppPage.login.toPath,
          builder: (context, state) => Demo(
            title: "Login",
            args: DemoScreenArguments(AppPage.login.toPath),
          ),
        ),
        GoRoute(
          path: AppPage.register.toPath,
          builder: (context, state) => const Demo(title: "Register"),
        ),
        GoRoute(
            path: AppPage.home.toPath,
            builder: (context, state) => Demo(
                  title: "Home",
                  args: DemoScreenArguments(AppPage.home.toPath),
                ),
            routes: [
              GoRoute(
                path: AppPage.demo.toPath,
                builder: (context, state) => Demo(
                  title: "Demo",
                  args: DemoScreenArguments(AppPage.home.toPath),
                ),
              ),
            ]),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
      redirect: (BuildContext context, GoRouterState state) {
        final authProvider = _context.read<AuthProvider>();
        final onboardingProvider = _context.read<OnboardingProvider>();

        final isLoggedIn = authProvider.loggedIn;
        final showOnboardingPage = onboardingProvider.shouldShowOnboardingPage;

        if (showOnboardingPage) {
          return AppPage.onboarding.toPath;
        }

        if (!isLoggedIn) {
          return AppPage.login.toPath;
        }

        if (isLoggedIn && state.location == AppPage.home.toPath) {
          return AppPage.home.toPath;
        }

        return null;
      },
    );
  }

  GoRouter get router {
    return _goRouter;
  }
}
