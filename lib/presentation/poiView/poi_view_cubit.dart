import 'package:flutter_app/api/repositories/comment_repository.dart';
import 'package:flutter_app/api/repositories/voting_repository.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';

class PoiViewCubit extends Cubit<PoiViewState> {
  final PoiRepository _poIRepository;
  final CommentRepository _commentRepository;
  final VotingRepository _votingRepository;
  final String _poiId;

  PoiViewCubit(this._poIRepository, this._commentRepository,
      this._votingRepository, this._poiId)
      : super(PoiViewState()) {
    init(poiId: _poiId);
  }
  Future<void> getAllPois()
    async {
      try {
        var res = await _poIRepository.getPois();
        print(res);
        print("++++++++++++++++++++++++++");
        emit(state.copyWith());
      } catch (error) {
        print("Error in Cubit while getAllPOIs: $error");
      }
  }


  Future<bool> init({required String poiId}) async {
    bool successful = false;
    var res = await _poIRepository.findOne(poiId: poiId);
    res.whenOrNull(success: (value) {
      emit(state.copyWith(poi: value));
      successful = true;
    });

    var resComment = await _commentRepository.findAllFromPoI(poiId: poiId);
    resComment.whenOrNull(success: (value) {
      emit(state.copyWith(comments: value));
      successful = true;
    });

    var resVoting = await _votingRepository.findAllFromPoI(poiId: poiId);
    resVoting.whenOrNull(success: (value) {
      emit(state.copyWith(votings: value));
      successful = true;
    });

    return successful;
  }
}
