import 'package:flutter/material.dart';

import '../../../core/utils/query_context.dart';
import '../../../models/user/user.dart';

import 'auth_repository.dart';

class HttpAuthRepository implements AuthRepository {
  @override
  ValueNotifier<User?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<User> signIn({required QueryContext context}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({required QueryContext context}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
