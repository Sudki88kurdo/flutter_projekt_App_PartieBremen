import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repositories/user_repository.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final UserRepository _userRepository;
  ProfilePageCubit(this._userRepository) : super(const ProfilePageState());

  Future<void> logoutUser() async {
    try {
      await _userRepository.logoutUser();
      emit(state.copyWith(
          // Setzen Sie den Zustand nach Bedarf zurück oder führen Sie andere Aktionen aus
          ));
    } catch (error) {
      print("Error in Cubit while logout user: $error");
    }
  }

  Future<void> deleteUser() async {
    try {
      await _userRepository.deleteUser();
      emit(state.copyWith(
          // Setzen Sie den Zustand nach Bedarf zurück oder führen Sie andere Aktionen aus
          ));
    } catch (error) {
      print("Error in Cubit while deleting user: $error");
    }
  }
}
