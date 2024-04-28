import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';

part 'login_page_state.freezed.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
  }) = _LoginPageState;
}
