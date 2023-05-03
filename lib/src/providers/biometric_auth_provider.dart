import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

import '../core/utils/snack_bar.dart';

class BiometricAuthProvider with ChangeNotifier {
  bool _isBiometricSupported = false;
  List<BiometricType> _supportedBiometricType = [];
  final LocalAuthentication localAuthentication = LocalAuthentication();

  BiometricAuthProvider() : super() {
    isLocalAuthSupported();
  }

  isLocalAuthSupported() async {
    _isBiometricSupported = await localAuthentication.isDeviceSupported();
    if (_isBiometricSupported) {
      _supportedBiometricType =
          await localAuthentication.getAvailableBiometrics();
    }
    notifyListeners();
  }

  bool get isBiometricSupported => _isBiometricSupported;

  List<BiometricType> get supportedBiometricType => _supportedBiometricType;

  Future<bool> authWithBiometrics(
      {required BiometricType biometricType}) async {
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'verify to proceed',
            authMessages: biometricType != BiometricType.face
                ? [
                    const AndroidAuthMessages(
                      biometricHint: 'Touch the fingerprint sensor',
                      biometricNotRecognized: 'Fingerprint not recognized',
                      biometricSuccess: 'Fingerprint recognized',
                      cancelButton: 'Cancel',
                      signInTitle: 'Fingerprint Authentication',
                      biometricRequiredTitle: 'Fingerprint required',
                    ),
                  ]
                : [],
            options: const AuthenticationOptions(biometricOnly: false));
      } on PlatformException catch (e) {
        showError(message: e.message!);
      }
    }
    return isAuthenticated;
  }
}
