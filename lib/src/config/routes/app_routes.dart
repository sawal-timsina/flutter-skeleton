import 'package:go_router/go_router.dart';

import '../../core/utils/route_path.dart';
import '../../pages/demo.dart';
import '../../pages/not_found.dart';
import '../../providers/auth_provider.dart';

class AppRouter {
  late final AuthProvider authProvider;
  GoRouter get router => _goRouter;
  AppRouter(this.authProvider);

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: authProvider,
    initialLocation: AppPage.login.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPage.onboarding.toPath,
        name: AppPage.onboarding.toName,
        builder: (context, state) => const Demo(title: "Onboarding"),
      ),
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        builder: (context, state) => const Demo(title: "Home"),
      ),
      GoRoute(
        path: AppPage.login.toPath,
        name: AppPage.login.toName,
        builder: (context, state) => const Demo(title: "Login"),
      ),
      GoRoute(
        path: AppPage.register.toPath,
        name: AppPage.register.toName,
        builder: (context, state) => const Demo(title: "Register"),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
    redirect: (context, state) {
      final isLoggedIn = authProvider.loggedIn;
      if (isLoggedIn) {
        return AppPage.home.toPath;
      }
      return null;
    },
  );
}
