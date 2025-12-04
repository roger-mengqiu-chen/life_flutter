import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/auth/viewmodels/auth_viewmodel.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.viewmodel});

  final AuthViewmodel viewmodel;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _authStatus = 'Press Button to Check Biometrics';

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    setState(() {
      _isAuthenticating = true;
      _authStatus = 'Authenticating...';
    });

    authenticated = await widget.viewmodel.biometricAuthenticate();

    setState(() {
      _isAuthenticating = false;
      if (authenticated) {
        _authStatus = 'Authentication Successful! Welcome!';
        context.go(Routes.home);
      } else if (!authenticated) {
        _authStatus = 'Authentication Failed/Cancelled.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _isAuthenticating
                ? const CircularProgressIndicator()
                : const Icon(Icons.fingerprint, size: 80, color: Colors.indigo),
              const SizedBox(height: 30),
              Text(
                _authStatus,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}