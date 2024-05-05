import 'package:freezed_annotation/freezed_annotation.dart';
import '../../entities/poi.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Poi> pointsOfInterest,
  }) = _HomePageState;
}
