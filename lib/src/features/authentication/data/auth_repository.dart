import 'package:flutter/material.dart';
import '../../../core/utils/query_context.dart';
import '../../../models/user/user.dart';

abstract class AuthRepository {
  Future<User> signUp({required QueryContext context});
  Future<User> signIn({required QueryContext context});
  Future<void> signOut();
  // emits a new value every time the authentication state changes
  ValueNotifier<User?> authStateChanges();
}
