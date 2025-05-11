import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/query_context.dart';
import '../../../../models/user/user.dart';
import '../../data/auth_repository.dart';
import '../../data/http_auth_repository.dart';

final signInControllerProvider =
    AsyncNotifierProvider.autoDispose<SignInController, void>(
  SignInController.new,
);

class SignInController extends AutoDisposeAsyncNotifier<void> {
  late AuthRepository authRepository;
  late GlobalKey<FormBuilderState> formKey;

  @override
  FutureOr<void> build() {
    formKey = GlobalKey<FormBuilderState>();
    authRepository = ref.watch(authRepositoryProvider);
  }

  Future<void> signIn({QueryContext? context}) async {
    state = const AsyncLoading();
    // AsyncValue.guard handle error and success state itself.
    state = await AsyncValue.guard<User>(
      () => authRepository.signIn(context: QueryContext()),
    );
    if (state.hasValue && !state.isLoading && !state.hasError) {
      // navigate to home page
      // on signIn success;
    }
    if (state.hasError) {
      //show error dialog;
    }
  }
  //validation function goes here
}
