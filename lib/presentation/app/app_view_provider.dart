import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/openplz_repository.dart';
import 'package:flutter_app/api/repositories/poi_repository.dart';
import 'package:flutter_app/api/repositories/user_repository.dart';
import 'package:flutter_app/presentation/home-screen/home_screen_cubit.dart';
import 'package:flutter_app/presentation/login-page/login_page_cubit.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list_cubit.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_cubit.dart';
import 'package:flutter_app/presentation/start-page/start_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile/prfileNav/profileEdit-page/profileEdit_page_cubit.dart';
import '../register-page/register_page_cubit.dart';
import 'app_cubit.dart';
import 'app_view.dart';

class AppViewProvider extends StatelessWidget {
  const AppViewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // App Cubit
        BlocProvider(
          create: (context) => AppCubit(context.read<UserRepository>()),
        ),
        BlocProvider(create: (context) => StartPageCubit()),
        BlocProvider(
            create: (context) =>
                LoginPageCubit(context.read<UserRepository>())),
        BlocProvider(
            create: (context) =>
                RegisterPageCubit(context.read<UserRepository>())),
        BlocProvider(
          create: (context) => HomePageCubit(
            context.read<PoiRepository>(),
            context.read<OpenplzRepository>(),
          ),
        ),
        BlocProvider(
            create: (context) =>
                ProfilePageCubit(context.read<UserRepository>())),
        BlocProvider(
            create: (context) =>
                ProfileEditPageCubit(context.read<UserRepository>())),
        BlocProvider(
            create: (context) =>
                MyPoiListCubit(context.read<PoiRepository>())),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const AppView(),
      ),
    );
  }
}
