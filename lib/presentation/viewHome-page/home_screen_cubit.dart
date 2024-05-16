import 'package:flutter_app/api/repositories/openplz_repository.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';
import '../../entities/street.dart';
import 'home_screen_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final PoiRepository _poiRepository;
  final OpenplzRepository _openplz_repository;

  HomePageCubit(this._poiRepository, this._openplz_repository) : super(const HomePageState()) {
    loadPointsOfInterest();
  }

  Future<List<Street>> getStreets(String search) async {
    try {
      final streetResponse = await _openplz_repository.getStreets(search, 'Bremen', null, 1, 50);
      streetResponse.whenOrNull(
        success: (value) {
          emit(state.copyWith(streetResults: value));
        }
      );
      return state.streetResults;
    } catch (e) {
      logger.e('Error loading streets: $e');
    }
    return [];
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

  Future<void> updateNewPoiTitle(String title) async {
    emit(state.copyWith(
      newPoiTitle: title,
    ));
  }

  Future<void> updateNewPoiDescription(String description) async {
    emit(state.copyWith(
      newPoiDescription: description,
    ));
  }

  Future<void> updateNewPoiOrt(String ort) async {
    emit(state.copyWith(
      newPoiOrt: ort,
    ));
  }

  Future<void> updateNewPoiStreet(String street) async {
    emit(state.copyWith(
      newPoiStreet: street,
    ));
  }

  Future<bool> create({
    required String title,
    required String description,
    required bool active,
    required String creatorId,
    required String latitude,
    required String longitude,
  }) async {
    var successful = false;
    var res = await _poiRepository.create(
        title: title,
        description: description,
        active: active,
        creatorId: creatorId,
        latitude: latitude,
        longitude: longitude);
    res.whenOrNull(success: (value) {
      successful = true;
    });
    return successful;
  }
}
