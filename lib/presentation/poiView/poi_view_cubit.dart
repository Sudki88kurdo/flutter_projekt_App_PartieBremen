import 'package:flutter_app/api/repositories/comment_repository.dart';
import 'package:flutter_app/api/repositories/voting_repository.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';
import '../../entities/user.dart';

class PoiViewCubit extends Cubit<PoiViewState> {
  final PoiRepository _poIRepository;
  final CommentRepository _commentRepository;
  final VotingRepository _votingRepository;
  final String _poiId;

  PoiViewCubit(this._poIRepository, this._commentRepository,
      this._votingRepository, this._poiId)
      : super(PoiViewState.initial()) {
    init(poiId: _poiId);
    state.pagingController.addPageRequestListener(
      (pageKey) => findAllCommentsFromPoI(),
    );
    findAllCommentsFromPoI();
  }

  Future<bool> init({required String poiId}) async {
    bool successful = false;
    var res = await _poIRepository.findOne(poiId: poiId);
    res.whenOrNull(success: (value) {
      emit(state.copyWith(poi: value));
      successful = true;
    });

    var resVoting = await _votingRepository.findAllFromPoI(poiId: poiId);
    resVoting.whenOrNull(success: (value) {
      emit(state.copyWith(votings: value));
      successful = true;
    });

    return successful;
  }

  findAllCommentsFromPoI() async {
    var resComment = await _commentRepository.findAllFromPoI(poiId: _poiId);
    resComment.whenOrNull(success: (value) {
      emit(state.copyWith(comments: value));
      state.pagingController.itemList = value;
      ;
    });

    return state.comments;
  }

  void writeComment(String comment, User user) async {
    emit(state.copyWith(
      commentStatus: const ScreenStatus.loading(),
    ));
    var postedComment = await _commentRepository.writeComment(
        actualComment: comment,
        commenterId: user.id!,
        poiId: _poiId,
        commentId: null);
    postedComment.whenOrNull(success: (value) {
      emit(state.copyWith(
        commentStatus: const ScreenStatus.success(),
      ));
      findAllCommentsFromPoI();
      state.pagingController.refresh();
    });
  }
}
