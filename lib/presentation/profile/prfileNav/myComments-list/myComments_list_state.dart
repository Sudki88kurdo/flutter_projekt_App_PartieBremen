import 'package:flutter_app/entities/comments_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'myComments_list_state.freezed.dart';

enum MyCommentsListStatus { initial, loading, success, failure }

@freezed
class MyCommentsListState with _$MyCommentsListState {
  const factory MyCommentsListState({
    @Default(MyCommentsListStatus.initial) MyCommentsListStatus status,
    @Default([]) List<CommentsResponse> comments,

    String? errorMessage,
  }) = _MyCommentsListState;
}
