import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/user_repository.dart';
import '../../entities/user.dart';
import 'app_cubit_event.dart';
import 'app_state.dart';

///
/// authentication cubit, stores the current authentication state, allows to
/// use guest login, logout and validating if user is guest
///
class AppCubit extends Cubit<AppState>
    with BlocPresentationMixin<AppState, AppCubitEvent> {
  /// Constructor
  ///
  final UserRepository _userRepository;

  AppCubit(this._userRepository) : super(const AppState());

  Future<void> updateUser(User user) async {
    emit(state.copyWith(user: user));
  }
}
