import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text("Onboarding"),
      ),
    );
  }
}
