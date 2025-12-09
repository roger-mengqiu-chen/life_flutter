import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/auth/viewmodels/auth_viewmodel.dart';
import 'package:life_flutter/ui/core/icon.dart';
import 'package:logging/logging.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.viewmodel});

  final AuthViewmodel viewmodel;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _authStatus = '';
  final _log = Logger('AuthScreen');

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    _log.info('Authenticating...');
    bool authenticated = false;
    await widget.viewmodel.biometricAuthenticate();
    authenticated = await widget.viewmodel.authenticated;
    if (!mounted) return;

    if (authenticated) {
      context.go(Routes.home);
    } else {
      setState(() {
        _authStatus = 'Authentication Failed/Cancelled.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topSpace = screenHeight * 0.1;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: topSpace),
            Center(child: Logo()),
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
    );
  }
}