import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../config/firebase/index.dart';
import '../models/user/user.dart';

class AuthProvider with ChangeNotifier {
  User? _dbUser;

  User? get dbUser => _dbUser;

  fb.User? _user;

  fb.User? get user => _user;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  void setLoggedIn(bool loggedIn) {
    _loggedIn = loggedIn;
    notifyListeners();
  }

  AuthProvider() {
    firebaseAuth.authStateChanges().listen((fb.User? user) {
      if (user != null) {
        _user = user;
        _loggedIn = true;
      } else {
        _loggedIn = false;
        _user = null;
      }
      notifyListeners();
    });
  }
}
