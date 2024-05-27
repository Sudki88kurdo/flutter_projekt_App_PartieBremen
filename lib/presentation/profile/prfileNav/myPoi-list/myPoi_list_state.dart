import 'package:flutter_app/entities/poi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'myPoi_list_state.freezed.dart';

enum MyPoiListStatus { initial, loading, success, failure }

@freezed
class MyPoiListState with _$MyPoiListState {
  const factory MyPoiListState({
    @Default(MyPoiListStatus.initial) MyPoiListStatus status,
    @Default([]) List<Poi> pois,

    String? errorMessage,
  }) = _MyPoiListState;
}
