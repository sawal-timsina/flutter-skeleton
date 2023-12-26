import 'package:flutter/foundation.dart' show ValueListenable, VoidCallback;
import 'package:go_router/go_router.dart' show RoutingConfig;

/// A routing config that is never going to change.
class ConstantRoutingConfig extends ValueListenable<RoutingConfig> {
  const ConstantRoutingConfig(this.value);
  @override
  void addListener(VoidCallback listener) {
    // Intentionally empty because listener will never be called.
  }

  @override
  void removeListener(VoidCallback listener) {
    // Intentionally empty because listener will never be called.
  }

  @override
  final RoutingConfig value;
}
