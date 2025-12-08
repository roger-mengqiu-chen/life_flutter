import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/auth/viewmodels/auth_viewmodel.dart';
import 'package:life_flutter/ui/auth/widgets/auth_screen.dart';
import 'package:life_flutter/ui/categories/viewmodels/category_viewmodel.dart';
import 'package:life_flutter/ui/categories/widgets/category_screen.dart';
import 'package:life_flutter/ui/home/widgets/home_screen.dart';
import 'package:life_flutter/ui/setting/viewmodels/setting_viewmodel.dart';
import 'package:life_flutter/ui/setting/widgets/setting_screen.dart';
import 'package:life_flutter/utils/status.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('router');

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.auth,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.auth,
      name: 'auth',
      builder: (context, state) {
        return AuthScreen(
          viewmodel: AuthViewmodel(authRepository: context.read()),
        );
      }
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) {
        return HomeScreen();
      }
    ),
    GoRoute(
      path: Routes.categories,
      name: 'categories',
      builder: (context, state) {
        return CategoryScreen(
          viewmodel: CategoryViewmodel(categoryRepository: context.read())
        );
      }
    ),
    GoRoute(
      path: Routes.settings,
      name: 'settings',
      builder: (context, state) {
        return SettingScreen(
          viewmodel: SettingViewmodel(settingRepository: context.read())
        );
      }
    )
  ]
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final authRepository = context.read<AuthRepository>();
  final status = authRepository.authStatus;

  final isAuthRoute = state.matchedLocation == Routes.auth;
  final authenticated = await authRepository.authenticated;
  print('authenticated: $authenticated');
  print('isAuthRoute: $isAuthRoute');

  if (status == AuthStatus.unknown) {
    _log.info('Unknown status');
    return null;
  }

  if (authenticated && isAuthRoute) {
    _log.info('Authenticated and trying to access auth route');
    return Routes.home;
  }

  if (!authenticated && !isAuthRoute ) {
    _log.info('Not authenticated and trying to access non-auth route');
    return Routes.auth;
  }

  return null;
}