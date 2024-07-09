import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../widgets/atoms/text_input.dart';
import '../signup/signup_view.dart';
import 'signin_controller.dart';

class SignIn extends ConsumerStatefulWidget {
  static const String routeName = "/SignIn";
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends ConsumerState<SignIn> {
  @override
  Widget build(BuildContext context) {
    final signInWatch = ref.watch(signInControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder(
                key: ref.read(signInControllerProvider.notifier).formKey,
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
                  ref.read(signInControllerProvider.notifier).signIn();
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
                child: signInWatch.isLoading
                    ? const Text("Loading")
                    : const Text("SignIn"),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  context.push(SignUp.routeName);
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
                child: const Text(
                  "push :: ${SignUp.routeName}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
