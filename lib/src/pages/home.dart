import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/extentions/button.dart';
import '../core/extentions/context.dart';
import 'demo.dart';

class Home extends StatefulWidget {
  static const String routeName = "/";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                context.push(Demo.routeName);
              },
              style: context.theme.outlinedButtonTheme.outline(),
              child: const Text("Click me"),
            ),
          ],
        ),
      ),
    );
  }
}
