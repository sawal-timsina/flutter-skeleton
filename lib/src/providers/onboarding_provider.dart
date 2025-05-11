import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../injector.dart';

class OnboardingProvider with ChangeNotifier {
  late bool _shouldShowOnboardingPage;

  OnboardingProvider() : super() {
    _shouldShowOnboardingPage =
        sharedPreferences.getBool('shouldShowOnboardingPage') ?? true;
  }

  bool get shouldShowOnboardingPage => _shouldShowOnboardingPage;

  void onboardingFinish() {
    sharedPreferences.setBool('shouldShowOnboardingPage', false);
    _shouldShowOnboardingPage = false;
    notifyListeners();
  }
}

final onBoardingProvider =
    ChangeNotifierProvider((ref) => OnboardingProvider());
