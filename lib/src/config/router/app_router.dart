import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter, RoutingConfig;

import '../../app.dart';
import '../../pages/auth/index.dart';
import '../../pages/auth/login/login.dart';
import '../../pages/index.dart' show Home, Onboarding, PageNotFound, Register;
import '../../pages/not_found/internet_not_found.dart';
import '../../providers/provider_instance.dart';
import 'app_route_config.dart';

class AppRouter extends GoRouter {
  final WidgetRef ref;
  AppRouter({super.refreshListenable, required this.ref})
      : super.routingConfig(
          navigatorKey: mainNavigator,
          routingConfig: ConstantRoutingConfig(
            RoutingConfig(
              routes: <GoRoute>[
                GoRoute(
                  path: InternetNotFound.routeName,
                  builder: (context, state) => const InternetNotFound(),
                ),
                GoRoute(
                  path: Onboarding.routeName,
                  builder: (context, state) => const Onboarding(),
                  redirect: (context, state) =>
                      ref.read(onBoardingProvider).shouldShowOnboardingPage
                          ? Onboarding.routeName
                          : null,
                ),
                GoRoute(
                  path: Auth.routeName,
                  builder: (context, state) => const Auth(),
                ),
                GoRoute(
                  path: Login.routeName,
                  builder: (context, state) => const Login(),
                ),
                GoRoute(
                  path: Register.routeName,
                  builder: (context, state) => const Register(),
                ),
                GoRoute(
                  path: Home.routeName,
                  builder: (context, state) => const Home(),
                  redirect: (context, state) {
                    final loggedIn = ref.read(authProvider).loggedIn;
                    if (!loggedIn) return Auth.routeName;
                    return null;
                  },
                ),
              ],
              redirect: (context, state) {
                final loggedIn = ref.read(authProvider).loggedIn;
                if (loggedIn) return Home.routeName;
                return null;
              },
            ),
          ),
          initialLocation: Auth.routeName,
          errorBuilder: (context, state) => const PageNotFound(),
        );
}
