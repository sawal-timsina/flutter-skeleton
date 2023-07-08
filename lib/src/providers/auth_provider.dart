import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../models/user/user.dart';

class AuthProvider with ChangeNotifier {
  User? _dbUser;

  AuthProvider() : super() {
    _dbUser = null;
  }

  void setAuthUser(User user) async {
    _dbUser = user;
    notifyListeners();
  }

  User? get dbUser => _dbUser;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  void setUserLoggedIn(bool loggedIn) {
    _loggedIn = loggedIn;
    notifyListeners();
  }
}
