import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page.dart';
import 'package:flutter_app/presentation/viewHome-page/prfileNav/profile-page/profile_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repositories/user_repository.dart';




/// Main entry point of the application if the user is authenticated.

class ProfilePageProvider extends StatelessWidget {
  static const String routeName = 'profile-page';
  const ProfilePageProvider({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfilePageCubit(context.read<UserRepository>()),
      child: LoginPage(),
    );
  }
}
