import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/user_repository.dart';
import '../../entities/user.dart';
import 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {

  final UserRepository _userRepository;

  LoginPageCubit(this._userRepository) : super(LoginPageState());

  Future<ApiResult<User>> login({required String email, required String password}) async {
    return await _userRepository.loginUser(email: email, password: password);
  }
}
