import 'package:life_flutter/data/repositories/auth_repository.dart';

class AuthViewmodel {
  AuthViewmodel({required AuthRepository authRepository})
  : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<bool> biometricAuthenticate() async {
    bool biometricsEnabled = await _authRepository.biometricsAuthEnabled;
    if (!biometricsEnabled) return true;

    bool res = await _authRepository.biometricsAuthenticate();
    return res;
  }
}