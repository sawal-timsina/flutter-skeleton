import 'package:flutter/material.dart'
    show NavigatorObserver, Route, debugPrint;

class RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(
      "didPush :: previousRoute: ${previousRoute?.settings.name} -> newRoute: "
      "${route.settings.name}",
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(
      "didPop :: previousRoute: ${previousRoute?.settings.name} <- newRoute: "
      "${route.settings.name}",
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(
      "didRemove :: previousRoute: ${previousRoute?.settings.name} -> "
      "newRoute: ${route.settings.name}",
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint(
      "didRemove :: oldRoute: ${oldRoute?.settings.name} -> "
      "newRoute: ${newRoute?.settings.name}",
    );
  }
}
