import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/error/error_page.dart';
import 'package:flutter_app/presentation/home-screen/home_screen.dart';
import 'package:flutter_app/presentation/login-page/login_page_provider.dart';
import 'package:flutter_app/presentation/poiView/poi_view_provider.dart';
import 'package:flutter_app/presentation/poiView/widgets/add_survey.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_provider.dart';
import 'package:flutter_app/presentation/register-page/register_page.dart';
import 'package:flutter_app/presentation/register-page/register_page_provider.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_app/presentation/survey-page/survey_view_provider.dart';
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
        builder: (_, __) => const StartPageProvider()),
    GoRoute(
        name: LoginPageProvider.routeName,
        path: '/${LoginPageProvider.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_, __) => const LoginPageProvider()),
    GoRoute(
        name: HomeScreen.routeName,
        path: '/${HomeScreen.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_, __) => HomeScreen()),
    GoRoute(
      name: RegisterPageProvider.routeName,
      path: '/${RegisterPageProvider.routeName}',
      parentNavigatorKey: _rootNavigationKey,
      builder: (_, __) => RegisterPage(),
    ),
    GoRoute(
      name: PoiViewProvider.routeName,
      path: '/${PoiViewProvider.routeName}:poiId',
      parentNavigatorKey: _rootNavigationKey,
      builder: (_, state) {
        var poiId = state.pathParameters["poiId"];
        return PoiViewProvider(poiId: poiId ?? "");
      },
    ),
    GoRoute(
      name: ProfilePageProvider.routeName,
      path: '/${ProfilePageProvider.routeName}',
      parentNavigatorKey: _rootNavigationKey,
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      name: SurveyPagePageProvider.routeName,
      path: '/${SurveyPagePageProvider.routeName}:surveyId',
      parentNavigatorKey: _rootNavigationKey,
      builder: (_, state) {
        var surveyId = state.pathParameters['surveyId'];
        return SurveyPagePageProvider(surveyId: surveyId ?? '');
      },
    ),
    GoRoute(
        name: AddSurvey.routeName,
        path: '/${AddSurvey.routeName}',
        parentNavigatorKey: _rootNavigationKey,
        builder: (_, __) => AddSurvey()),
  ],
);
