import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app.dart';
import '../config/themes/colors.dart';
import '../core/utils/route_path.dart';
import '../providers/auth_provider.dart';
import '../widgets/atoms/text_input.dart';

class DemoScreenArguments {
  final String phone;

  DemoScreenArguments(this.phone);
}

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.title, this.args}) : super(key: key);

  final String title;
  final DemoScreenArguments? args;

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
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
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
                    context.read<AuthProvider>().setUerLoggedIn(true);
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
                  child: const Text("Login > redirect to home"),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      context.go(AppPage.onboarding.toPath);
                    },
                    child: const Text("Click me > Go method")),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      context.goNamed(AppPage.onboarding.toName);
                    },
                    child: const Text("click me > Go named method")),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      context.push(AppPage.onboarding.toPath);
                    },
                    child: const Text("Click me > push method")),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppPage.onboarding.toName);
                    },
                    child: const Text("Click me > Push named method")),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
