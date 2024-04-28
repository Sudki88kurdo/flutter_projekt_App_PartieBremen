import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/user_repository.dart';
import 'package:flutter_app/presentation/error/error_page.dart';
import 'package:flutter_app/presentation/login-page/login_page_provider.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigationKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigationKey,
  errorBuilder: (context, state) => ErrorPage(state: state),
  routes: [
    ///
    /// Entry
    ///
    GoRoute(
      name: StartPageProvider.routeName,
      path: '/',
      parentNavigatorKey: _rootNavigationKey,
      builder: (_,__) => const StartPageProvider()
    ),
    GoRoute(
        name: LoginPageProvider.routeName,
        path: '/${LoginPageProvider.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_,__) => const LoginPageProvider()
    ),
  ],
);
