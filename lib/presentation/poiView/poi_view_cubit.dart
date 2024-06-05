import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/comment_repository.dart';
import 'package:flutter_app/api/repositories/petition_repository.dart';
import 'package:flutter_app/api/repositories/survey_repository.dart';
import 'package:flutter_app/api/repositories/voting_repository.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:flutter_app/entities/petition_response.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';
import '../../entities/user.dart';

enum VoteType { UP, DOWN }

class PoiViewCubit extends Cubit<PoiViewState> {
  final PoiRepository _poIRepository;
  final CommentRepository _commentRepository;
  final VotingRepository _votingRepository;
  final SurveyRepository _surveyRepository;

  final PetitionRepository _petitionRepository;
  final String _poiId;

  PoiViewCubit(
    this._poIRepository,
    this._commentRepository,
    this._votingRepository,
    this._surveyRepository,
    this._petitionRepository,
    this._poiId,
  ) : super(PoiViewState.initial()) {
    init(poiId: _poiId);
    state.commentsPagingController.addPageRequestListener(
      (pageKey) => findAllCommentsFromPoI(),
    );
    state.surveyPagingController.addPageRequestListener(
      (pageKey) => findAllSurveysFromPoI(),
    );
    state.petitionPagingController
        .addPageRequestListener((pageKey) => findAllPetitionsFromPoI());
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

    var resVoting = await _votingRepository.findAllFromPoI(poiId: poiId);
    resVoting.whenOrNull(success: (value) {
      emit(state.copyWith(votings: value));
      successful = true;
    });

    var resSurvey = await _surveyRepository.getAllSurveys();
    resSurvey.whenOrNull(success: (value) {
      emit(state.copyWith(surveys: value));
      successful = true;
    });

    var resPetition =
        await _petitionRepository.findPOIsPetitions(poiId: _poiId);
    resPetition.whenOrNull(failure: (value) {
      emit(state.copyWith(petitions: []));
      state.petitionPagingController.appendLastPage([]);
    }, success: (value) {
      emit(state.copyWith(petitions: value));
      successful = true;
    });

    return successful;
  }

  findAllCommentsFromPoI() async {
    var resComment = await _commentRepository.findAllFromPoI(poiId: _poiId);
    resComment.whenOrNull(success: (value) {
      emit(state.copyWith(comments: value));
      state.commentsPagingController.appendLastPage(value);
    });

    return state.comments;
  }

  Future<List<SurveyResponse>> findAllSurveysFromPoI() async {
    //TODO change to from poi request
    var resSurvey = await _surveyRepository.getAllSurveys();
    resSurvey.whenOrNull(success: (value) {
      emit(state.copyWith(surveys: value));
      state.surveyPagingController.appendLastPage(value);
    });

    return state.surveys;
  }

  findAllPetitionsFromPoI() async {
    var resPetition =
        await _petitionRepository.findPOIsPetitions(poiId: _poiId);
    resPetition.whenOrNull(failure: (value) {
      print("here123");
      emit(state.copyWith(petitions: []));
      state.petitionPagingController.appendLastPage([]);
    }, success: (value) {
      emit(state.copyWith(petitions: value));
      state.petitionPagingController.appendLastPage(value);
    });

    return state.petitions;
  }

  Future<void> createSurvey({
    required String title,
    required String description,
    required String expiresAt,
    required String creatorId,
    required double poiId,
  }) async {
    emit(state.copyWith(
      surveyStatus: const ScreenStatus.loading(),
    ));
    try {
      final resSurvey = await _surveyRepository.create(
        titel: title,
        beschreibung: description,
        expiresAt: expiresAt,
        creatorId: creatorId,
        poiId: poiId,
      );

      resSurvey.whenOrNull(
        success: (newSurvey) {
          final updatedSurveys = List<SurveyResponse>.from(state.surveys)
            ..add(newSurvey);
          emit(state.copyWith(
            surveys: updatedSurveys,
            surveyStatus: const ScreenStatus.success(),
          ));
          state.surveyPagingController.appendLastPage([newSurvey]);
        },
        failure: (error) {
          emit(state.copyWith(
            surveyStatus: ScreenStatus.error(msg: error.toString()),
          ));
        },
      );
    } catch (error) {
      emit(state.copyWith(
        surveyStatus: ScreenStatus.error(msg: error.toString()),
      ));
    }
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
      state.commentsPagingController.itemList = [];
      emit(state.copyWith(
        commentStatus: const ScreenStatus.success(),
        comments: [],
      ));
      findAllCommentsFromPoI();
    });
  }

  void createVote(VoteType voteType, String voterId,
      {String? poiId, String? commentId}) async {
    emit(state.copyWith(
      commentStatus: const ScreenStatus.loading(),
    ));
    var postedVoting = await _votingRepository.createVoting(
        voteType: voteType,
        voterId: voterId,
        poiId: poiId,
        commentId: commentId);
    postedVoting.whenOrNull(success: (value) {
      emit(state.copyWith(
        commentStatus: const ScreenStatus.success(),
      ));
    });

    var resVoting = await _votingRepository.findAllFromPoI(poiId: _poiId);
    resVoting.whenOrNull(success: (value) {
      emit(state.copyWith(votings: value));
    });
  }

  void updateIndex(int index) async {
    emit(state.copyWith(listIndex: index));
  }

  Future<ApiResult<PetitionResponse>> createPetition() async {
    var res = await _petitionRepository.create(
      title: state.newPetitionTitle!,
      description: state.newPetitionDescription!,
      expireAt: DateTime.now().toString(),
      goal: state.newPetitionGoal!,
      poiId: _poiId,
    );

    return res;
  }

  void updateNewPetitionTitle(String title) {
    emit(state.copyWith(newPetitionTitle: title));
  }

  void updateNewPetitionDescription(String title) {
    emit(state.copyWith(newPetitionDescription: title));
  }

  void updateNewPetitionGoal(String title) {
    emit(state.copyWith(newPetitionGoal: int.parse(title)));
  }

  void refreshControllers() async {
    state.commentsPagingController.refresh();
    state.surveyPagingController.refresh();
    state.petitionPagingController.refresh();
  }
}
