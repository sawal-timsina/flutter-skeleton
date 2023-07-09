import 'package:go_router/go_router.dart' show GoRoute, GoRouter;
import 'package:provider/provider.dart' show ReadContext;

import '../../pages/demo.dart';
import '../../pages/home.dart';
import '../../pages/login.dart';
import '../../pages/not_found.dart';
import '../../pages/onboarding.dart';
import '../../pages/register.dart';
import '../../providers/auth_provider.dart';
import '../../providers/onboarding_provider.dart';

class AppRouter extends GoRouter {
  AppRouter({super.refreshListenable})
      : super(
          initialLocation: Onboarding.routeName,
          routes: <GoRoute>[
            GoRoute(
              path: Onboarding.routeName,
              builder: (context, state) => const Onboarding(),
              redirect: (context, state) =>
                  context.read<OnboardingProvider>().shouldShowOnboardingPage
                      ? Onboarding.routeName
                      : null,
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
            ),
            GoRoute(
              path: Demo.routeName,
              builder: (context, state) => const Demo(
                title: "Demo",
                args: DemoScreenArguments(Home.routeName),
              ),
            )
          ],
          errorBuilder: (context, state) => const NotFoundPage(),
          redirect: (context, state) {
            final loggedIn = context.read<AuthProvider>().loggedIn;
            final loggingIn = state.matchedLocation == Login.routeName;

            if (!loggedIn && !loggingIn) return Login.routeName;

            if (loggedIn && loggingIn) return Home.routeName;

            return null;
          },
        );
}
