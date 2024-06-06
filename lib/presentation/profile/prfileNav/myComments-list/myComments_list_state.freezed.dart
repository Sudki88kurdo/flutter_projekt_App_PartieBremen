// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myComments_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyCommentsListState {
  MyCommentsListStatus get status => throw _privateConstructorUsedError;
  List<CommentsResponse> get comments => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCommentsListStateCopyWith<MyCommentsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCommentsListStateCopyWith<$Res> {
  factory $MyCommentsListStateCopyWith(
          MyCommentsListState value, $Res Function(MyCommentsListState) then) =
      _$MyCommentsListStateCopyWithImpl<$Res, MyCommentsListState>;
  @useResult
  $Res call(
      {MyCommentsListStatus status,
      List<CommentsResponse> comments,
      String? errorMessage});
}

/// @nodoc
class _$MyCommentsListStateCopyWithImpl<$Res, $Val extends MyCommentsListState>
    implements $MyCommentsListStateCopyWith<$Res> {
  _$MyCommentsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? comments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyCommentsListStatus,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsResponse>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyCommentsListStateImplCopyWith<$Res>
    implements $MyCommentsListStateCopyWith<$Res> {
  factory _$$MyCommentsListStateImplCopyWith(_$MyCommentsListStateImpl value,
          $Res Function(_$MyCommentsListStateImpl) then) =
      __$$MyCommentsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MyCommentsListStatus status,
      List<CommentsResponse> comments,
      String? errorMessage});
}

/// @nodoc
class __$$MyCommentsListStateImplCopyWithImpl<$Res>
    extends _$MyCommentsListStateCopyWithImpl<$Res, _$MyCommentsListStateImpl>
    implements _$$MyCommentsListStateImplCopyWith<$Res> {
  __$$MyCommentsListStateImplCopyWithImpl(_$MyCommentsListStateImpl _value,
      $Res Function(_$MyCommentsListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? comments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MyCommentsListStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyCommentsListStatus,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsResponse>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyCommentsListStateImpl implements _MyCommentsListState {
  const _$MyCommentsListStateImpl(
      {this.status = MyCommentsListStatus.initial,
      final List<CommentsResponse> comments = const [],
      this.errorMessage})
      : _comments = comments;

  @override
  @JsonKey()
  final MyCommentsListStatus status;
  final List<CommentsResponse> _comments;
  @override
  @JsonKey()
  List<CommentsResponse> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MyCommentsListState(status: $status, comments: $comments, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCommentsListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_comments), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCommentsListStateImplCopyWith<_$MyCommentsListStateImpl> get copyWith =>
      __$$MyCommentsListStateImplCopyWithImpl<_$MyCommentsListStateImpl>(
          this, _$identity);
}

abstract class _MyCommentsListState implements MyCommentsListState {
  const factory _MyCommentsListState(
      {final MyCommentsListStatus status,
      final List<CommentsResponse> comments,
      final String? errorMessage}) = _$MyCommentsListStateImpl;

  @override
  MyCommentsListStatus get status;
  @override
  List<CommentsResponse> get comments;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MyCommentsListStateImplCopyWith<_$MyCommentsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
