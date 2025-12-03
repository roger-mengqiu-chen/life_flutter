import 'package:go_router/go_router.dart';
import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/auth/widgets/auth_screen.dart';
import 'package:life_flutter/ui/home/widgets/home_screen.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.auth,
  debugLogDiagnostics: true,
  refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.auth,
      name: 'auth',
      builder: (context, state) {
        return AuthScreen();
      }
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) {
        return HomeScreen();
      }
    )
  ]
);

