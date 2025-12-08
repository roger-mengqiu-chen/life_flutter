import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logging/logging.dart';

class BiometricService {
  final _auth = LocalAuthentication();
  final _log = Logger('BiometricService');

  Future<bool> hasBiometrics() async {
    try {
      if (!await _auth.canCheckBiometrics) return false;

      final availableBiometrics = await _auth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Auth to access app',
        persistAcrossBackgrounding: true,
      );
    } on PlatformException catch(e) {
      if (e.code == 'notAvailable' || e.code == 'notEnrolled') {
        _log.info('Biometric not available or not enrolled');
        return false;
      }
      _log.severe('Error during authentication: ${e.code} - ${e.message}');
      return false;
    }
  }
}