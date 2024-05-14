import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repositories/user_repository.dart';
import 'profileEdit_page_state.dart';


class ProfileEditPageCubit extends Cubit<ProfileEditPageState> {

  final UserRepository _userRepository;

  ProfileEditPageCubit(this._userRepository) : super(const ProfileEditPageState());

  Future<void> updateUser({
    required String id,
    required String name,
    required String surname,
    //required DateTime dob,
    required String email,
    required String password,
    required bool verified,
    required int role,

   // required DateTime dob
  }) async {
    var res =  await _userRepository.updateUser(id:id,name: name, surname: surname, email:email, password: password,verified:verified,role:role);
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
  Future<void> updatePickedDate(DateTime pickedDate) async {
    emit(
        state.copyWith(
            pickedDate: pickedDate
        )
    );
  }
}
