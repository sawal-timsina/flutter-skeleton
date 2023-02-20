import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../app.dart';
import '../config/themes/colors.dart';
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
          title: const Text("asdasd"),
        ),
        body: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.title),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: onPressed, child: const Text("Click Me")),
                const SizedBox(height: 8),
                TextButton(onPressed: onPressed, child: const Text("Click Me")),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: onPressed,
                  style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  child: const Text("Click Me"),
                ),
                const SizedBox(height: 8),
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      TextInput(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        required: true,
                        name: "name",
                        label: "Name",
                        hintText: "Enter your name",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: "Required")
                        ]),
                      ),
                      const SizedBox(height: 8),
                      TextInput(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        required: true,
                        name: "password",
                        label: "Password",
                        hintText: "Enter your password",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: "Required")
                        ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
