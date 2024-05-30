import 'package:flutter_app/entities/comments_response.dart';
import 'package:flutter_app/entities/petition_response.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:flutter_app/entities/survey_response.dart';
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
    @Default([]) List<SurveyResponse> surveys,
    @Default([]) List<PetitionResponse> petitions,
    @Default([]) List<VotingsResponse> votings,
    @Default(ScreenStatus.loading()) ScreenStatus commentStatus,
    @Default(0) int listIndex,
    required PagingController<int, CommentsResponse> commentsPagingController,
    required PagingController<int, SurveyResponse> surveyPagingController,
    required PagingController<int, PetitionResponse> petitionPagingController,
  }) = _PoiViewState;

  factory PoiViewState.initial() => PoiViewState(
      commentsPagingController:
          PagingController<int, CommentsResponse>(firstPageKey: 1),
      surveyPagingController:
          PagingController<int, SurveyResponse>(firstPageKey: 1),
      petitionPagingController:
          PagingController<int, PetitionResponse>(firstPageKey: 1));
}
