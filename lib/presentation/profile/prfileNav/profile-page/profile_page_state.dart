
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/screen_status.dart';
import '../../../../entities/user.dart';


part 'profile_page_state.freezed.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(null) User? user,

  }) = _ProfilePageState;

}

