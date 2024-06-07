import 'package:flutter_app/entities/street.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/poi.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(0) int selectedIndex,
    @Default([]) List<Poi> pointsOfInterest,
    @Default([]) List<Street> streetResults,
    @Default(53.0793) double focusPointLat,
    @Default(8.8017) double focusPointLong,
    @Default(null) String? newPoiTitle,
    @Default(null) String? newPoiDescription,
    @Default(null) String? newPoiOrt,
    @Default(null) String? newPoiStreet,
  }) = _HomePageState;
}
