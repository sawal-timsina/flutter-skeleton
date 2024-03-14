import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/validators/auth_validator.dart';
import '../../../injector.dart';
import '../../../widgets/index.dart';
import 'register_view_model.dart';

class Register extends ConsumerStatefulWidget {
  static const String routeName = "/register";

  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register>
    with AuthValidator, RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    return NetworkScaffold(
      appBar: const PageHeader(title: "Register Page"),
      mainBody: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(
                size: 80,
              ),
              const SizedBox(
                height: 40,
              ),
              TextInput(
                name: fullName.toLowerCase(),
                label: tr(fullName),
                hintText: tr(enterYourFullName),
                validator: fullNameValidator,
                required: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                name: email.toString(),
                label: tr(email),
                hintText: tr(enterYourEmail),
                validator: emailValidator,
                required: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                name: password.toLowerCase(),
                label: tr(password),
                hintText: tr(enterYourPassword),
                validator: passwordValidator,
                required: true,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: onRegisterPressed,
                child: const Text(register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
