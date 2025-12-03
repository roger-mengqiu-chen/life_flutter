import 'package:life_flutter/data/services/auth.dart';

class AuthRepository {
  AuthRepository();
  bool isAuthenticated = false;

  Future<bool> biometricsAuthenticate() {
    return BiometricService.authenticate();
  }
}