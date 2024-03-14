import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../injector.dart';
import '../../../models/user/user.dart';
import '../../../providers/index.dart';
import 'login.dart';

mixin LoginViewModel on ConsumerState<Login> {
  void onLoginPressed() {
    if (formKey.currentState!.saveAndValidate()) {
      final User user = User.fromJson(
        {
          ...formKey.currentState?.value ?? {},
          ...{"id": UniqueKey().toString()},
        },
      );
      ref.read(authProvider)
        ..setAuthUser(user)
        ..setUserLoggedIn(
          true,
        );
    }
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }
}
