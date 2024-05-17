import 'package:flutter_app/entities/comments_response.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../common/screen_status.dart';
import '../../entities/votings_response.dart';

part 'poi_view_state.freezed.dart';

@freezed
class PoiViewState with _$PoiViewState {
  const factory PoiViewState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(null) Poi? poi,
    @Default([]) List<CommentsResponse> comments,
    @Default([]) List<VotingsResponse> votings,
  }) = _PoiViewState;
}
