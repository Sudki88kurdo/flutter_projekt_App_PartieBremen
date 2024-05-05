import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/repositories/poi_repository.dart';
import 'home_screen_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final PoiRepository _poiRepository;

  HomePageCubit(this._poiRepository) : super(const HomePageState()) {
    loadPointsOfInterest();
  }

  Future<void> loadPointsOfInterest() async {
    try {
      final poiResponse = await _poiRepository.getPois();
      poiResponse.whenOrNull(
        success: (value) {
          emit(HomePageState(pointsOfInterest: value));
        },
      );
    } catch (e) {
      print('Error loading points of interest: $e');
    }
  }

  Future<void> updateIndex(int index) async {
    emit(state.copyWith(
      selectedIndex: index,
    ));
  }
}
