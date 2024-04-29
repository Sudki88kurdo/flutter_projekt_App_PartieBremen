import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/user_repository.dart';
import '../../entities/user.dart';
import 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {

  final UserRepository _userRepository;

  RegisterPageCubit(this._userRepository) : super(const RegisterPageState());

  Future<void> register({required String name, required String surname, required DateTime dob, required String email, required String password, required bool verified, required bool active}) async {
    var res = await _userRepository.registerUser(email: email, name: name, surname: surname, password: password, verified: verified, dob: dob, active: true);
    res.whenOrNull(success: (value) {
      emit(
        state.copyWith(registerSuccessful: true)
      );
    });
  }

  Future<void> updatePickedDate(DateTime pickedDate) async {
    emit(
      state.copyWith(
        pickedDate: pickedDate
      )
    );
  }
}
