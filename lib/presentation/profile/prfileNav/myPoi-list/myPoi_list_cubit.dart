import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/api/repositories/poi_repository.dart';


class MyPoiListCubit extends Cubit<MyPoiListState> {
  final PoiRepository _poiRepository;

  MyPoiListCubit(this._poiRepository) : super(MyPoiListState());

  Future<void> getAllPois() async {
    emit(state.copyWith(status: MyPoiListStatus.loading));
    try {
      var result = await _poiRepository.getPois();
      result.when(
        success: (pois) {
          emit(state.copyWith(status: MyPoiListStatus.success, pois: pois));
        },
        failure: (error) {
          emit(state.copyWith(status: MyPoiListStatus.failure, errorMessage: error.toString()));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: MyPoiListStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> findUserPOIs({required String userId}) async {
    emit(state.copyWith(status: MyPoiListStatus.loading));
    try {
      var result = await _poiRepository.findUserPOIs(userId: userId);
      result.when(
        success: (pois) {
         emit(state.copyWith(status: MyPoiListStatus.success, pois: pois));
        },
        failure: (error) {
          emit(state.copyWith(status: MyPoiListStatus.failure, errorMessage: error.toString()));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: MyPoiListStatus.failure, errorMessage: e.toString()));
    }
  }
}
