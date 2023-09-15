import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/extentions/button.dart';
import '../core/extentions/context.dart';
import '../providers/auth_provider.dart';
import 'home.dart';
import 'login.dart';
import 'onboarding.dart';

class DemoScreenArguments {
  final String path;

  const DemoScreenArguments(this.path);
}

class Demo extends ConsumerStatefulWidget {
  static const String routeName = "/demo";
  final String title;
  final DemoScreenArguments args;

  const Demo({
    Key? key,
    required this.title,
    this.args = const DemoScreenArguments("Demo"),
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DemoState();
}

class _DemoState extends ConsumerState<Demo> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final authState = ref.read(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                onPressed: () {
                  authState.setUserLoggedIn(false);
                },
                style: context.theme.outlinedButtonTheme.outline(),
                child: const Text("Logout"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.go(Login.routeName);
                },
                child: const Text("go :: ${Login.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(Login.routeName);
                },
                child: const Text("push :: ${Login.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(Onboarding.routeName);
                },
                child: const Text("push :: ${Onboarding.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push("${Home.routeName}/${Demo.routeName}");
                },
                child: const Text("push :: ${Demo.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacement(Login.routeName);
                },
                child: const Text("pushNamed :: ${Login.routeName}"),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
