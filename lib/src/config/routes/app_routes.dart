import 'package:flutter/material.dart' show BuildContext, Listenable;
import 'package:go_router/go_router.dart' show GoRoute, GoRouter;
import 'package:provider/provider.dart' show ReadContext;

import '../../app.dart';
import '../../pages/demo.dart';
import '../../pages/home.dart';
import '../../pages/login.dart';
import '../../pages/not_found.dart';
import '../../pages/onboarding.dart';
import '../../pages/register.dart';
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
      initialLocation: Home.routeName,
      routes: <GoRoute>[
        GoRoute(
          path: Onboarding.routeName,
          builder: (context, state) => const Onboarding(),
        ),
        GoRoute(
          path: Login.routeName,
          builder: (context, state) => const Login(),
          redirect: (context, state) =>
              context.read<AuthProvider>().loggedIn ? Home.routeName : null,
        ),
        GoRoute(
          path: Register.routeName,
          builder: (context, state) => const Register(),
          redirect: (context, state) =>
              context.read<AuthProvider>().loggedIn ? Home.routeName : null,
        ),
        GoRoute(
          path: Home.routeName,
          builder: (context, state) => const Home(),
          redirect: (context, state) =>
              context.read<AuthProvider>().loggedIn ? null : Login.routeName,
          routes: [
            GoRoute(
              path: Demo.routeName,
              builder: (context, state) => const Demo(
                title: "Demo",
                args: DemoScreenArguments(Home.routeName),
              ),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
      // redirect: (BuildContext context, GoRouterState state) {
      //   final authProvider = _context.read<AuthProvider>();
      //   final onboardingProvider = _context.read<OnboardingProvider>();
      //
      //   final isLoggedIn = authProvider.loggedIn;
      // final showOnboardingPage = onboardingProvider.shouldShowOnboardingPage;
      //
      //   if (showOnboardingPage) {
      //     return Onboarding.routeName;
      //   }
      //
      //   if (!isLoggedIn) {
      //     return Login.routeName;
      //   }
      //
      //   if (isLoggedIn && state.location == Home.routeName) {
      //     return Home.routeName;
      //   }
      //
      //   return null;
      // },
    );
  }

  GoRouter get router {
    return _goRouter;
  }
}
