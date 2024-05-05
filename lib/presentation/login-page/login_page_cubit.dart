import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/user_repository.dart';
import 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {

  final UserRepository _userRepository;

  LoginPageCubit(this._userRepository) : super(const LoginPageState());

  Future<bool> login({required String email, required String password}) async {
    var res =  await _userRepository.loginUser(email: email, password: password);
    bool successful = false;
    res.whenOrNull(success: (value) {
      emit(
        state.copyWith(
          user: value
        )
      );
      successful = true;
    });
    return successful;
  }

  Future<void> updatePasswordVisible() async {
    emit(
      state.copyWith(
        passwordVisible: !state.passwordVisible
      )
    );
  }
}
