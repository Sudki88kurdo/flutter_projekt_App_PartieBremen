
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/screen_status.dart';
import '../../../../entities/user.dart';



part 'profileEdit_page_state.freezed.dart';

@freezed
class ProfileEditPageState with _$ProfileEditPageState {
  const factory ProfileEditPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(false) bool passwordVisible,
    @Default(null) User? user,
    @Default(null) DateTime? pickedDate,
  }) = _ProfileEditPageState;
}

