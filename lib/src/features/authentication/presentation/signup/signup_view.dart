import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../providers/connectivity_provider.dart';
import '../../../../widgets/atoms/text_input.dart';
import 'signup_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  static const String routeName = "/SignUp";
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final sigUpWatch = ref.watch(signUpControllerProvider);

    final networkStatus = ref.watch(connectivityStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder(
                key: ref.read(signUpControllerProvider.notifier).formKey,
                child: Column(
                  children: [
                    TextInput(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      required: true,
                      name: "name",
                      label: tr("Name"),
                      hintText: tr("Enter your name"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Required"),
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
                        FormBuilderValidators.required(errorText: "Required"),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  ref.read(signUpControllerProvider.notifier).signUp();
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
                child: sigUpWatch.isLoading
                    ? const Text("Loading")
                    : const Text("SignUp"),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  context.pop();
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
                child: const Text("Go Back"),
              ),
              Text(
                networkStatus == ConnectivityStatus.isConnected
                    ? 'Connected to the Internet'
                    : 'Disconnected from the Internet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
