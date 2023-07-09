import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/onboarding_provider.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = "/onboarding";

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<OnboardingProvider>().onboardingFinish();
          },
          child: const Text("Finish Onboarding"),
        ),
      ),
    );
  }
}
