import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

/// State holder of the [AppCubit].
@freezed
class AppState with _$AppState {
  const factory AppState({
    String? error,
  }) = _AppState;
}
