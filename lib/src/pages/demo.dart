import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../config/themes/colors.dart';
import '../core/utils/route_path.dart';
import '../providers/auth_provider.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/atoms/text_input.dart';

class DemoScreenArguments {
  final String path;

  const DemoScreenArguments(this.path);
}

class Demo extends StatefulWidget {
  final String title;
  final DemoScreenArguments args;

  const Demo({
    Key? key,
    required this.title,
    this.args = const DemoScreenArguments("asd"),
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
              FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    TextInput(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      required: true,
                      name: "name",
                      label: tr("Name"),
                      hintText: tr("Enter your name"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Required")
                      ]),
                    ),
                    const SizedBox(height: 8),
                    TextInput(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      required: true,
                      name: "password",
                      label: tr("Password"),
                      hintText: tr("Enter your password"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Required")
                      ]),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  if (widget.args.path == AppPage.login.toPath ||
                      widget.args.path == AppPage.home.toPath) {
                    context.read<AuthProvider>().setUserLoggedIn(
                        !context.read<AuthProvider>().loggedIn);
                    return;
                  }

                  if (widget.args.path == AppPage.onboarding.toPath) {
                    context.read<OnboardingProvider>().onboardingFinish();
                  }
                },
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      side: const MaterialStatePropertyAll(
                        BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                child: Text(widget.args.path == AppPage.onboarding.toPath
                    ? "Finish Onboarding"
                    : "Login/Logout"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.go(AppPage.login.toPath);
                },
                child: Text("go :: ${AppPage.login.toPath}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(AppPage.onboarding.toPath);
                },
                child: Text("push :: ${AppPage.onboarding.toPath}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(AppPage.demo.toPath);
                },
                child: Text("push :: ${AppPage.demo.toPath}"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.push(AppPage.register.toPath);
                },
                child: Text("pushNamed :: ${AppPage.register.toPath}"),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
