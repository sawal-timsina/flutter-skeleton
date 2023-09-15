import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../config/themes/colors.dart';
import '../providers/auth_provider.dart';
import '../widgets/atoms/text_input.dart';

class Login extends ConsumerStatefulWidget {
  static const String routeName = "/login";

  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
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
        title: const Text("Login"),
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
                  ref.read(authProvider).setUserLoggedIn(
                        !ref.read(authProvider).loggedIn,
                      );
                  return;
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
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
