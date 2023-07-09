import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../widgets/atoms/text_input.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text("Register"),
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
                      name: "email",
                      label: tr("Email"),
                      hintText: tr("Enter your email"),
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
            ],
          ),
        ),
      ),
    );
  }
}
