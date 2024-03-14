import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../injector.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false) {
    state = prefs.getBool("dark_mode") ?? false;
  }
  void toggle() {
    state = !state;
    prefs.setBool("dark_mode", state);
  }
}
