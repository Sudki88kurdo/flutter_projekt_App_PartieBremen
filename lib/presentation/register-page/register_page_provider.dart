import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/register-page/register_page.dart';
import 'package:flutter_app/presentation/register-page/register_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/user_repository.dart';

/// Main entry point of the application if the user is authenticated.
class RegisterPageProvider extends StatelessWidget {
  static const String routeName = 'register-page';
  const RegisterPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterPageCubit(context.read<UserRepository>()),
      child: RegisterPage(),
    );
  }
}
