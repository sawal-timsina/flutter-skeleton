enum AppPage { home, login, onboarding, register, demo, biometric }

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.onboarding:
        return '/onboarding';
      case AppPage.login:
        return '/login';
      case AppPage.register:
        return '/register';
      case AppPage.biometric:
        return '/biometric';
      case AppPage.demo:
        return 'demo';
      case AppPage.home:
        return '/';
      default:
        return '/';
    }
  }
}
