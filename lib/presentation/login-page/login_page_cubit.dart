import 'package:flutter/cupertino.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/user_repository.dart';
import 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  final UserRepository _userRepository;

  LoginPageCubit(this._userRepository) : super(const LoginPageState());

  Future<bool> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var res = await _userRepository.loginUser(email: email, password: password);
    bool successful = false;
    await res.whenOrNull(
      success: (value) async {
        emit(state.copyWith(user: value));
        successful = true;
        await context.read<AppCubit>().updateUser(value);
      },
    );
    return successful;
  }

  Future<void> updatePasswordVisible() async {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }
}
