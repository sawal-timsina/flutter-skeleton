import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;

import '../../providers/index.dart' show authProvider;

mixin HomeViewModel {
  void onLogout(WidgetRef ref) {
    ref.read(authProvider).setUserLoggedIn(false);
  }
}
