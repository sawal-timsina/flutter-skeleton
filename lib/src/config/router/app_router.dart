import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter, RoutingConfig;

import '../../features/authentication/data/http_auth_repository.dart';
import '../../features/authentication/presentation/signin/signin_view.dart';
import '../../features/authentication/presentation/signup/signup_view.dart';
import '../../features/demo.dart';
import '../../features/home.dart';

import '../../features/not_found.dart';
import '../../features/onboarding/presentation/onboarding.dart';
import '../../features/onboarding/presentation/onboarding_provider.dart';
import 'app_route_config.dart';

class AppRouter extends GoRouter {
  final WidgetRef ref;
  final List<NavigatorObserver> navigatorObserver;

  AppRouter({
    super.refreshListenable,
    required this.ref,
    required this.navigatorObserver,
  }) : super.routingConfig(
          routingConfig: ConstantRoutingConfig(
            RoutingConfig(
              routes: <GoRoute>[
                GoRoute(
                  path: Onboarding.routeName,
                  builder: (context, state) => const Onboarding(),
                  redirect: (context, state) =>
                      ref.read(onBoardingProvider).shouldShowOnboardingPage
                          ? Onboarding.routeName
                          : null,
                ),
                GoRoute(
                  path: SignIn.routeName,
                  builder: (context, state) => const SignIn(),
                ),
                GoRoute(
                  path: SignUp.routeName,
                  builder: (context, state) => const SignUp(),
                ),
                GoRoute(
                  path: Home.routeName,
                  builder: (context, state) => const Home(),
                ),
                GoRoute(
                  path: Demo.routeName,
                  builder: (context, state) => const Demo(
                    title: "Demo",
                    args: DemoScreenArguments(Home.routeName),
                  ),
                ),
              ],
              redirect: (context, state) {
                final loggedIn =
                    ref.watch(authRepositoryProvider).authStateChanges();
                final loggingIn = state.matchedLocation == SignIn.routeName ||
                    state.matchedLocation == SignUp.routeName;

                if (loggedIn.value == null && !loggingIn) {
                  return SignIn.routeName;
                }

                if (loggedIn.value != null && loggingIn) return Home.routeName;

                return null;
              },
            ),
          ),
          initialLocation: Onboarding.routeName,
          errorBuilder: (context, state) => const NotFoundPage(),
          observers: navigatorObserver,
        );
}
