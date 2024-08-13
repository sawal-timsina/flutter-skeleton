import 'dart:developer';

import 'package:flutter/material.dart';

import '../../injector.dart';

class AnalyticsNavigatorObserver extends NavigatorObserver {
  Future<void> _sendScreenView(PageRoute<dynamic> route) async {
    final screenName = route.settings.name;
    log('Screen viewed: $screenName');
    await firebaseAnalytics.logScreenView(
      screenName: screenName,
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) {
      _sendScreenView(route);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute) {
      _sendScreenView(previousRoute);
    }
    super.didPop(route, previousRoute);
  }
}
