import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';

class PoiViewCubit extends Cubit<PoiViewState> {
  final PoiRepository _poIRepository;
  final String _poiId;

  PoiViewCubit(this._poIRepository, this._poiId) : super(const PoiViewState()) {
    init(poiId: _poiId);
  }

  Future<bool> init({required String poiId}) async {
    bool successful = false;
    var res = await _poIRepository.findOne(poiId: poiId);
    res.whenOrNull(success: (value) {
      emit(state.copyWith(poi: value));
      successful = true;
    });
    return successful;
  }
}
