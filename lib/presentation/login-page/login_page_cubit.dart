import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/user_repository.dart';
import '../../entities/user.dart';
import 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {

  final UserRepository _userRepository;

  LoginPageCubit(this._userRepository) : super(const LoginPageState());

  Future<void> login({required String email, required String password}) async {
    var res =  await _userRepository.loginUser(email: email, password: password);
    res.whenOrNull(success: (value) {
      emit(
        state.copyWith(
          user: value
        )
      );
    });
  }

  Future<void> updatePasswordVisible() async {
    emit(
      state.copyWith(
        passwordVisible: !state.passwordVisible
      )
    );
  }
}
