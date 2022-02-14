import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/pages/demo.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(
      RouteSettings settings, bool isLoggedIn) {
    if (!isLoggedIn) {
      switch (settings.name) {
        case 'login':
          return _materialRoute(const Demo(title: "Login"));
        case 'register':
          return _materialRoute(const Demo(title: 'Register'));
      }
    }

    if (isLoggedIn) {
      switch (settings.name) {
        case 'update_profile':
          return _materialRoute(const Demo(title: 'Update Profile'));
        case 'update_mobile':
          return _materialRoute(const Demo(title: 'Update Mobile'));
        case 'update_password':
          return _materialRoute(const Demo(title: 'Update Password'));
        case 'update_email':
          return _materialRoute(const Demo(title: 'Update Email'));
      }
    }

    switch (settings.name) {
      case '/':
        return _materialRoute(const Demo(title: "Home"));
      case "onboarding":
        return _materialRoute(const Demo(title: "Onboarding"));
      case 'inquiry':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return _materialRoute(Demo(title: "Inquiry", args: args));
      case 'about':
        return _materialRoute(const Demo(title: "About"));
      case 'terms_and_condition':
        return _materialRoute(const Demo(title: "Terms and condition"));
      case 'privacy_policy':
        return _materialRoute(const Demo(title: "Privacy Policy"));
      case 'extra':
        return _materialRoute(const Demo(title: "Extra"));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
