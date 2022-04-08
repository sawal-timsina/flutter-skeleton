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
      }
    }

    switch (settings.name) {
      case '/':
        return _materialRoute(const Demo(title: "Home"));
      case "onboarding":
        return _materialRoute(const Demo(title: "Onboarding"));
      case 'about':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return _materialRoute(Demo(title: "About", args: args));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
