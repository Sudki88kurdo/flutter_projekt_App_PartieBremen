import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profileEdit-page/profileEdit_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/repositories/user_repository.dart';
import '../../../home-screen/home_screen.dart';

/// Main entry point of the application if the user is authenticated.

class ProfileEditPageProvider extends StatelessWidget {
  const ProfileEditPageProvider({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileEditPageCubit(context.read<UserRepository>()),
      child: HomeScreen(),
    );
  }
}
