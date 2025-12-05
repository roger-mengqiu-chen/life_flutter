import 'package:flutter/material.dart';
import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class AppLifecycleObserver extends StatefulWidget {
  const AppLifecycleObserver({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppLifecycleObserver> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends State<AppLifecycleObserver>
    with WidgetsBindingObserver {
  late AuthRepository _authRepository;
  final _log = Logger('AppLifecycleObserver');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authRepository = context.read();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      _authRepository.authenticated = false;
      _log.info('User backgrounded/locked screen. Authenticated set to false.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}