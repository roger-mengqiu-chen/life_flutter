import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:life_flutter/utils/status.dart';

class AuthViewmodel {
  AuthViewmodel({required AuthRepository authRepository})
  : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> biometricAuthenticate() async {
    await _authRepository.biometricsAuthenticate();
  }

  Future<bool> get authenticated async {
    return await _authRepository.authenticated;
  }

  set authStatus(AuthStatus status) {
    _authRepository.authStatus = status;
  }
}