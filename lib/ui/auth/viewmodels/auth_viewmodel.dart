import 'package:life_flutter/data/repositories/auth_repository.dart';

class AuthViewmodel {
  AuthViewmodel({required AuthRepository authRepository})
  : _authRepository = authRepository;

  final AuthRepository _authRepository;


}