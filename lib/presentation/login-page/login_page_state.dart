import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/entities/user.dart';
part 'login_page_state.freezed.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(false) bool passwordVisible,
    @Default(null) User? user
  }) = _LoginPageState;
}
