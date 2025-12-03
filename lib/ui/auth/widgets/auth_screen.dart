import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  bool _isAuthenticating = false;
  String _authStatus = 'Press Button to Check Biometrics';

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      _authStatus = 'Error checking biometrics: ${e.message}';
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
      _authStatus = canCheckBiometrics
          ? 'Biometrics available. Press button to login.'
          : 'Biometrics not available or not configured.';
    });
  }

  // 2. Start the authentication process
  Future<void> _authenticate() async {
    bool authenticated = false;
    setState(() {
      _isAuthenticating = true;
      _authStatus = 'Authenticating...';
    });

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Please scan your fingerprint or use Face ID to log in.',
          persistAcrossBackgrounding: false
      );
    } on PlatformException catch (e) {
      print(e);
      _authStatus = 'Authentication failed: ${e.message}';
    }

    setState(() {
      _isAuthenticating = false;
      if (authenticated) {
        _authStatus = 'Authentication Successful! Welcome!';
        // TODO: Navigate to the main app screen
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
              const Icon(Icons.fingerprint, size: 80, color: Colors.indigo),
              const SizedBox(height: 30),
              Text(
                _authStatus,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon: _isAuthenticating
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.lock_open),
                label: Text(_isAuthenticating ? 'CANCEL' : 'LOGIN WITH BIOMETRICS'),
                onPressed: _canCheckBiometrics && !_isAuthenticating
                    ? _authenticate
                    : null, // Disable button if not ready or currently authenticating
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}