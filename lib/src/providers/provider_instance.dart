import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ChangeNotifierProvider, StateNotifierProvider;

import 'index.dart'
    show
        AuthProvider,
        ConnectivityStatusNotifier,
        DarkModeNotifier,
        OnboardingProvider;

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());
final onBoardingProvider =
    ChangeNotifierProvider((ref) => OnboardingProvider());
final connectivityProvider = ChangeNotifierProvider(
  (ref) => ConnectivityStatusNotifier(),
);
final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
