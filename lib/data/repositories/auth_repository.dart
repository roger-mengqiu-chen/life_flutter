import 'package:flutter/foundation.dart';
import 'package:life_flutter/config/settings.dart';
import 'package:life_flutter/data/services/auth.dart';
import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/utils/status.dart';
import 'package:logging/logging.dart';

class AuthRepository extends ChangeNotifier{
  AuthRepository({
    required DB db,
    required BiometricService biometricService
  })
  : _db = db,
    _biometricService = biometricService;

  final DB _db;
  final BiometricService _biometricService;
  final _log = Logger('AuthRepository');

  AuthStatus authStatus = AuthStatus.unknown;

  bool get authenticated => authStatus == AuthStatus.authenticated;

  Future<void> biometricsAuthenticate() async {
    authStatus = AuthStatus.authenticating;
    if (!await biometricsAuthEnabled) {
      authStatus = AuthStatus.authenticated;
      _log.info('Biometrics auth disabled. Skipping.');
      notifyListeners();
      return;
    }

    bool succeed = await _biometricService.authenticate();
    if (succeed) {
      authStatus = AuthStatus.authenticated;
      _log.info('Passed biometric auth');
    } else {
      authStatus = AuthStatus.unauthenticated;
      _log.info('Failed biometric auth');
    }
    notifyListeners();
  }

  void lock() {
    authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<bool> get biometricsAuthEnabled async {
    bool hasBiometrics = await _biometricService.hasBiometrics();
    final result = await _db.query(
      'SELECT value FROM settings WHERE name = \'${Settings.biometricsAuthentication}\''
    );

    bool biometricsEnabled = result.isNotEmpty && result[0]['value'] == '1';
    return hasBiometrics && biometricsEnabled;
  }
}