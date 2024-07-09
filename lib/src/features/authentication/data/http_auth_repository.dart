import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/query_context.dart';
import '../../../models/user/user.dart';

import 'auth_repository.dart';

final Map<String, dynamic> mockUser = {
  "id": 1,
  "firebase_uid": "uid123",
  "nick_name": "nickName",
  "email": "email",
  "full_name": "fullName",
  "resident_status": "residentStatus",
  "gender": "gender",
  "phone": "phone",
  "age": "age",
  "is_phone_verified": true,
  "updated_at": "updatedAt",
  "created_at": "createdAt",
};

class HttpAuthRepository implements AuthRepository {
  final ValueNotifier<User?> _currentUser = ValueNotifier(null);

  @override
  ValueNotifier<User?> authStateChanges() {
    return _currentUser;
  }

  @override
  Future<User> signIn({required QueryContext context}) async {
    // TODO: implement signIn API
    Future.delayed(const Duration(seconds: 5));
    final user = User.fromJson(mockUser);
    _currentUser.value = user;
    return user;
  }

  @override
  Future<void> signOut() async {
    _currentUser.value = null;
  }

  @override
  Future<User> signUp({required QueryContext context}) async {
    // TODO: implement signUp API
    Future.delayed(const Duration(seconds: 5));
    final user = User.fromJson(mockUser);
    _currentUser.value = user;
    return user;
  }
}

// Dependency Injector
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return HttpAuthRepository();
});
