import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page.dart';
import 'package:flutter_app/presentation/login-page/login_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/user_repository.dart';

/// Main entry point of the application if the user is authenticated.
class LoginPageProvider extends StatelessWidget {
  static const String routeName = 'login-page';
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginPageCubit(context.read<UserRepository>()),
      child: LoginPage(),
    );
  }
}
