import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/extensions/button.dart';
import '../core/extensions/context.dart';
import 'authentication/data/http_auth_repository.dart';
import 'authentication/presentation/signin/signin_view.dart';
import 'home.dart';

import 'onboarding/presentation/onboarding.dart';

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
    final authState = ref.read(authRepositoryProvider);

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
                  authState.signOut();
                },
                style: context.theme.outlinedButtonTheme.outline(),
                child: const Text("Logout"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.go(SignIn.routeName);
                },
                child: const Text("go :: ${SignIn.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(SignIn.routeName);
                },
                child: const Text("push :: ${SignIn.routeName}"),
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
                  context.pushReplacement(SignIn.routeName);
                },
                child: const Text("pushNamed :: ${SignIn.routeName}"),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
