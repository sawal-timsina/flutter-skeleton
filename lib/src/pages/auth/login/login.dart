import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/validators/auth_validator.dart';
import '../../../injector.dart';
import '../../../widgets/atoms/text_input.dart';
import '../../../widgets/molecules/index.dart';
import '../../../widgets/organisms/network_scaffold.dart';
import 'login_view_model.dart';

class Login extends ConsumerStatefulWidget {
  static const String routeName = "/login";
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login>
    with AuthValidator, LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return NetworkScaffold(
      bodyPadding: const EdgeInsets.symmetric(horizontal: 15),
      appBar: const PageHeader(title: loginPage),
      mainBody: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 80,
            ),
            const SizedBox(
              height: 40,
            ),
            TextInput(
              name: email.toLowerCase(),
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
              onPressed: onLoginPressed,
              child: const Text(login),
            ),
          ],
        ),
      ),
    );
  }
}
