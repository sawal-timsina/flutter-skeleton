import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../injector.dart';
import '../../../models/user/user.dart';
import '../../../providers/index.dart';
import 'register.dart';

mixin RegisterViewModel on ConsumerState<Register> {
  void onRegisterPressed() {
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
