import 'package:flutter_app/entities/poi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';

part 'poi_view_state.freezed.dart';

@freezed
class PoiViewState with _$PoiViewState {
  const factory PoiViewState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(null) Poi? poi,
  }) = _PoiViewState;
}
