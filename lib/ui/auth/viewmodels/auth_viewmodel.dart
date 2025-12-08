import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:life_flutter/utils/status.dart';

class AuthViewmodel {
  AuthViewmodel({required AuthRepository authRepository})
  : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> biometricAuthenticate() async {
    await _authRepository.biometricsAuthenticate();
  }

  bool get authenticated  {
    return _authRepository.authenticated;
  }

  set authStatus(AuthStatus status) {
    _authRepository.authStatus = status;
  }
}