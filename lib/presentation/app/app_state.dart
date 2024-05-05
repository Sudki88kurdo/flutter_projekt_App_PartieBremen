import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/user.dart';

part 'app_state.freezed.dart';

/// State holder of the [AppCubit].
@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? user,
    String? error,
  }) = _AppState;
}
