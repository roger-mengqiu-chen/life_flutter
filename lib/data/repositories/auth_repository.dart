import 'package:flutter/material.dart';
import 'package:life_flutter/data/services/auth.dart';

import '../services/db.dart';

class AuthRepository extends ChangeNotifier{
  AuthRepository({required DB db}) : _db = db;
  final DB _db;
  final bool _isAuthenticated = false;

  Future<bool> biometricsAuthenticate() async {
    bool result = await BiometricService.authenticate();
    notifyListeners();
    return result;
  }

  Future<bool> get isBiometricsAuthEnabled async {
    final result = await _db.query('SELECT value FROM settings WHERE name = \'biometricsEnabled\'');
  }

  Future<bool> get isAuthenticated async{
    if (!_isAuthenticated) {
      return await biometricsAuthenticate();
    }
    return _isAuthenticated;
  }
}