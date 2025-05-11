import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/onboarding_provider.dart';

class Onboarding extends ConsumerStatefulWidget {
  static const String routeName = "/onboarding";

  const Onboarding({super.key});

  @override
  ConsumerState<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(onBoardingProvider).onboardingFinish();
          },
          child: const Text("Finish Onboarding"),
        ),
      ),
    );
  }
}
