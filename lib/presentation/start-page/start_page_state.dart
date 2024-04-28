import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';

part 'start_page_state.freezed.dart';

@freezed
class StartPageState with _$StartPageState {
  const factory StartPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
  }) = _StartPageState;
}
