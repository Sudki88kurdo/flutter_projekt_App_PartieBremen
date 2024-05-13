import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/error/error_page.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen.dart';
import 'package:flutter_app/presentation/login-page/login_page_provider.dart';
import 'package:flutter_app/presentation/register-page/register_page.dart';
import 'package:flutter_app/presentation/register-page/register_page_provider.dart';
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
    GoRoute(
        name: HomeScreen.routeName,
        path: '/${HomeScreen.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_,__) => HomeScreen()
    ),
    GoRoute(
        name: RegisterPageProvider.routeName,
        path: '/${RegisterPageProvider.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_,__) => RegisterPage()
    )
  ],
);
