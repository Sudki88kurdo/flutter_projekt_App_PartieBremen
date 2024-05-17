// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return _CommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponse {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  User? get commenter => throw _privateConstructorUsedError;
  List<dynamic>? get votings => throw _privateConstructorUsedError;
  List<dynamic>? get comments => throw _privateConstructorUsedError;
  List<dynamic>? get reports => throw _privateConstructorUsedError;
  String? get actualcomment => throw _privateConstructorUsedError;
  List<dynamic>? get voting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsResponseCopyWith<CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseCopyWith<$Res> {
  factory $CommentsResponseCopyWith(
          CommentsResponse value, $Res Function(CommentsResponse) then) =
      _$CommentsResponseCopyWithImpl<$Res, CommentsResponse>;
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      User? commenter,
      List<dynamic>? votings,
      List<dynamic>? comments,
      List<dynamic>? reports,
      String? actualcomment,
      List<dynamic>? voting});

  $UserCopyWith<$Res>? get commenter;
}

/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res, $Val extends CommentsResponse>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? commenter = freezed,
    Object? votings = freezed,
    Object? comments = freezed,
    Object? reports = freezed,
    Object? actualcomment = freezed,
    Object? voting = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commenter: freezed == commenter
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as User?,
      votings: freezed == votings
          ? _value.votings
          : votings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      actualcomment: freezed == actualcomment
          ? _value.actualcomment
          : actualcomment // ignore: cast_nullable_to_non_nullable
              as String?,
      voting: freezed == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get commenter {
    if (_value.commenter == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.commenter!, (value) {
      return _then(_value.copyWith(commenter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsResponseImplCopyWith<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  factory _$$CommentsResponseImplCopyWith(_$CommentsResponseImpl value,
          $Res Function(_$CommentsResponseImpl) then) =
      __$$CommentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      User? commenter,
      List<dynamic>? votings,
      List<dynamic>? comments,
      List<dynamic>? reports,
      String? actualcomment,
      List<dynamic>? voting});

  @override
  $UserCopyWith<$Res>? get commenter;
}

/// @nodoc
class __$$CommentsResponseImplCopyWithImpl<$Res>
    extends _$CommentsResponseCopyWithImpl<$Res, _$CommentsResponseImpl>
    implements _$$CommentsResponseImplCopyWith<$Res> {
  __$$CommentsResponseImplCopyWithImpl(_$CommentsResponseImpl _value,
      $Res Function(_$CommentsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? commenter = freezed,
    Object? votings = freezed,
    Object? comments = freezed,
    Object? reports = freezed,
    Object? actualcomment = freezed,
    Object? voting = freezed,
  }) {
    return _then(_$CommentsResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commenter: freezed == commenter
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as User?,
      votings: freezed == votings
          ? _value._votings
          : votings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      actualcomment: freezed == actualcomment
          ? _value.actualcomment
          : actualcomment // ignore: cast_nullable_to_non_nullable
              as String?,
      voting: freezed == voting
          ? _value._voting
          : voting // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsResponseImpl implements _CommentsResponse {
  const _$CommentsResponseImpl(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.commenter,
      final List<dynamic>? votings,
      final List<dynamic>? comments,
      final List<dynamic>? reports,
      this.actualcomment,
      final List<dynamic>? voting})
      : _votings = votings,
        _comments = comments,
        _reports = reports,
        _voting = voting;

  factory _$CommentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final User? commenter;
  final List<dynamic>? _votings;
  @override
  List<dynamic>? get votings {
    final value = _votings;
    if (value == null) return null;
    if (_votings is EqualUnmodifiableListView) return _votings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _comments;
  @override
  List<dynamic>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _reports;
  @override
  List<dynamic>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? actualcomment;
  final List<dynamic>? _voting;
  @override
  List<dynamic>? get voting {
    final value = _voting;
    if (value == null) return null;
    if (_voting is EqualUnmodifiableListView) return _voting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommentsResponse(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, commenter: $commenter, votings: $votings, comments: $comments, reports: $reports, actualcomment: $actualcomment, voting: $voting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.commenter, commenter) ||
                other.commenter == commenter) &&
            const DeepCollectionEquality().equals(other._votings, _votings) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.actualcomment, actualcomment) ||
                other.actualcomment == actualcomment) &&
            const DeepCollectionEquality().equals(other._voting, _voting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      commenter,
      const DeepCollectionEquality().hash(_votings),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_reports),
      actualcomment,
      const DeepCollectionEquality().hash(_voting));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      __$$CommentsResponseImplCopyWithImpl<_$CommentsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsResponseImplToJson(
      this,
    );
  }
}

abstract class _CommentsResponse implements CommentsResponse {
  const factory _CommentsResponse(
      {final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final User? commenter,
      final List<dynamic>? votings,
      final List<dynamic>? comments,
      final List<dynamic>? reports,
      final String? actualcomment,
      final List<dynamic>? voting}) = _$CommentsResponseImpl;

  factory _CommentsResponse.fromJson(Map<String, dynamic> json) =
      _$CommentsResponseImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  User? get commenter;
  @override
  List<dynamic>? get votings;
  @override
  List<dynamic>? get comments;
  @override
  List<dynamic>? get reports;
  @override
  String? get actualcomment;
  @override
  List<dynamic>? get voting;
  @override
  @JsonKey(ignore: true)
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
