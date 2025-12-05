import 'package:flutter/foundation.dart';
import 'package:life_flutter/config/settings.dart';
import 'package:life_flutter/data/services/auth.dart';
import 'package:life_flutter/data/services/db.dart';

class AuthRepository extends ChangeNotifier{
  AuthRepository({
    required DB db,
    required BiometricService biometricService
  }) : _db = db, _biometricService = biometricService;

  final DB _db;
  final BiometricService _biometricService;
  bool authenticated = false;

  Future<bool> biometricsAuthenticate() async {
    bool result = await _biometricService.authenticate();
    notifyListeners();
    return result;
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