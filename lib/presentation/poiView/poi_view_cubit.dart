import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/repositories/answer_repository.dart';
import 'package:flutter_app/api/repositories/comment_repository.dart';
import 'package:flutter_app/api/repositories/petition_repository.dart';
import 'package:flutter_app/api/repositories/question_repository.dart';
import 'package:flutter_app/api/repositories/signature_repository.dart';
import 'package:flutter_app/api/repositories/survey_repository.dart';
import 'package:flutter_app/api/repositories/voting_repository.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/poi_repository.dart';
import '../../entities/question.dart';
import '../../entities/user.dart';

enum VoteType { UP, DOWN }

class PoiViewCubit extends Cubit<PoiViewState> {
  final PoiRepository _poIRepository;
  final CommentRepository _commentRepository;
  final VotingRepository _votingRepository;
  final SurveyRepository _surveyRepository;
  final PetitionRepository _petitionRepository;
  final SignatureRepository _signatureRepository;
  final QuestionRepository _questionRepository;
  final AnswerRepository _answerRepository;
  final String _poiId;

  PoiViewCubit(
    this._poIRepository,
    this._commentRepository,
    this._votingRepository,
    this._surveyRepository,
    this._petitionRepository,
    this._signatureRepository,
    this._questionRepository,
    this._answerRepository,
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

  Future<void> getAllPois() async {
    try {
      var res = await _poIRepository.getPois();
      print(res);
      print('++++++++++++++++++++++++++');
      emit(state.copyWith());
    } catch (error) {
      print('Error in Cubit while getAllPOIs: $error');
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

    var resSurvey = await _surveyRepository.getAllToPoiId(poiId: poiId);
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
    var resSurvey = await _surveyRepository.getAllToPoiId(poiId: _poiId);
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
      emit(state.copyWith(petitions: []));
      state.petitionPagingController.appendLastPage([]);
    }, success: (value) {
      emit(state.copyWith(petitions: value));
      state.petitionPagingController.appendLastPage(value);
    });

    return state.petitions;
  }

  Future<bool> createSignature(
      {required String petitionId, required String userId}) async {
    var success = false;
    final resSignature = await _signatureRepository.create(
        signerId: userId, petitionId: petitionId);
    await resSignature.whenOrNull(
      success: (value) async {
        state.petitionPagingController.itemList = [];
        emit(state.copyWith(
          commentStatus: const ScreenStatus.success(),
          petitions: [],
        ));
        success = true;
        await findAllPetitionsFromPoI();
      },
    );
    return success;
  }

  Future<void> createSurvey({
    required String title,
    required String description,
    required DateTime expiresAt,
    required String creatorId,
    required List<TextEditingController> questions,
    required List<QuestionType> questionTypes,
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
        poiId: _poiId,
      );

      resSurvey.whenOrNull(
        success: (newSurvey) {
          logger.i('Survey created: $newSurvey');
          final updatedSurveys = List<SurveyResponse>.from(state.surveys)
            ..add(newSurvey);
          emit(state.copyWith(
            surveys: updatedSurveys,
            surveyStatus: const ScreenStatus.success(),
          ));
          state.surveyPagingController.appendLastPage([newSurvey]);
          questions.asMap().forEach((index, item) {
            this._questionRepository.createQuestion(
                  surveyId: newSurvey.id!,
                  fragestellung: item.text,
                  type: questionTypes[index],
                );
          });
        },
        failure: (error) {
          logger.e('Error in Cubit while createSurvey: $error');
          emit(state.copyWith(
            surveyStatus: ScreenStatus.error(msg: error.toString()),
          ));
        },
      );
    } catch (error) {
      logger.e('Error in Cubit while createSurvey: $error');
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

  Future<bool> createVote(VoteType voteType, String voterId,
      {String? poiId, String? commentId}) async {
    var success = false;
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
      success = true;
    });

    var resVoting = await _votingRepository.findAllFromPoI(poiId: _poiId);
    resVoting.whenOrNull(success: (value) {
      emit(state.copyWith(votings: value));
    });
    return success;
  }

  void updateIndex(int index) async {
    emit(state.copyWith(listIndex: index));
  }

  Future<bool> createPetition() async {
    var success = false;
    emit(state.copyWith(
      commentStatus: const ScreenStatus.loading(),
    ));

    var res = await _petitionRepository.create(
      title: state.newPetitionTitle!,
      description: state.newPetitionDescription!,
      expireAt: DateTime.now().add(Duration(days: 30)),
      goal: state.newPetitionGoal!,
      poiId: _poiId,
    );

    res.whenOrNull(
      success: (value) {
        emit(
          state.copyWith(
            newPetitionDescription: '',
            newPetitionTitle: '',
            newPetitionGoal: 0,
            commentStatus: const ScreenStatus.success(),
          ),
        );
        success = true;
      },
    );
    state.petitionPagingController.itemList = [];
    emit(state.copyWith(
      commentStatus: const ScreenStatus.success(),
      petitions: [],
    ));
    findAllPetitionsFromPoI();
    return success;
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
