import 'package:flutter/cupertino.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/user_repository.dart';
import 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  final UserRepository _userRepository;

  RegisterPageCubit(this._userRepository) : super(const RegisterPageState());

  Future<bool> register({
    required String name,
    required String surname,
    required DateTime dob,
    required String email,
    required String password,
    required bool verified,
    required bool active,
    required BuildContext context,
  }) async {
    var res = await _userRepository.registerUser(
        email: email,
        name: name,
        surname: surname,
        password: password,
        verified: verified,
        dob: dob,
        active: true);
    bool registerSuccessful = false;
    await res.whenOrNull(
      success: (value) async {
        emit(state.copyWith(registerSuccessful: true, user: value));
        registerSuccessful = true;
        await context.read<AppCubit>().updateUser(value);
      },
    );
    return registerSuccessful;
  }

  Future<void> updatePickedDate(DateTime pickedDate) async {
    emit(state.copyWith(pickedDate: pickedDate));
  }
}
