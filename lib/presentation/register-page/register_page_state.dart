import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';

part 'register_page_state.freezed.dart';

@freezed
class RegisterPageState with _$RegisterPageState {
  const factory RegisterPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(false) bool registerSuccessful,
    @Default(null) DateTime? pickedDate,
  }) = _RegisterPageState;
}
