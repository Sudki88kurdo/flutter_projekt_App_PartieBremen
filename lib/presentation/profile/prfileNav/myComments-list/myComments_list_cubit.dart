import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repositories/comment_repository.dart';
import 'myComments_list_state.dart';


class MyCommentsListCubit extends Cubit<MyCommentsListState> {
  final CommentRepository _commentRepository;

  MyCommentsListCubit(this._commentRepository) : super(MyCommentsListState());


  Future<void> findUserComments({required String userId}) async {
    emit(state.copyWith(status: MyCommentsListStatus.loading));
    try {
      var result = await _commentRepository.findUserComments(userId: userId);
      result.when(
        success: (comments) {
         emit(state.copyWith(status: MyCommentsListStatus.success, comments: comments));
        },
        failure: (error) {
          emit(state.copyWith(status: MyCommentsListStatus.failure, errorMessage: error.toString()));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: MyCommentsListStatus.failure, errorMessage: e.toString()));
    }
  }
}
