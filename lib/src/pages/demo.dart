import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../core/extentions/button.dart';
import '../core/extentions/context.dart';
import 'login.dart';
import 'onboarding.dart';

class DemoScreenArguments {
  final String path;

  const DemoScreenArguments(this.path);
}

class Demo extends StatefulWidget {
  static const String routeName = "demo";
  final String title;
  final DemoScreenArguments args;

  const Demo({
    Key? key,
    required this.title,
    this.args = const DemoScreenArguments("Demo"),
  }) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final formKey = GlobalKey<FormBuilderState>();

  onPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                style: context.theme.outlinedButtonTheme.outline(),
                child: const Text("Click me"),
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
                  context.push(Onboarding.routeName);
                },
                child: const Text("push :: ${Onboarding.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(Demo.routeName);
                },
                child: const Text("push :: ${Demo.routeName}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacementNamed(Login.routeName);
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
