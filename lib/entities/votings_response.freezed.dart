// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'votings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VotingsResponse _$VotingsResponseFromJson(Map<String, dynamic> json) {
  return _VotingsResponse.fromJson(json);
}

/// @nodoc
mixin _$VotingsResponse {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  VoteType? get voteType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VotingsResponseCopyWith<VotingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VotingsResponseCopyWith<$Res> {
  factory $VotingsResponseCopyWith(
          VotingsResponse value, $Res Function(VotingsResponse) then) =
      _$VotingsResponseCopyWithImpl<$Res, VotingsResponse>;
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      VoteType? voteType});
}

/// @nodoc
class _$VotingsResponseCopyWithImpl<$Res, $Val extends VotingsResponse>
    implements $VotingsResponseCopyWith<$Res> {
  _$VotingsResponseCopyWithImpl(this._value, this._then);

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
    Object? voteType = freezed,
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
      voteType: freezed == voteType
          ? _value.voteType
          : voteType // ignore: cast_nullable_to_non_nullable
              as VoteType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VotingsResponseImplCopyWith<$Res>
    implements $VotingsResponseCopyWith<$Res> {
  factory _$$VotingsResponseImplCopyWith(_$VotingsResponseImpl value,
          $Res Function(_$VotingsResponseImpl) then) =
      __$$VotingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      VoteType? voteType});
}

/// @nodoc
class __$$VotingsResponseImplCopyWithImpl<$Res>
    extends _$VotingsResponseCopyWithImpl<$Res, _$VotingsResponseImpl>
    implements _$$VotingsResponseImplCopyWith<$Res> {
  __$$VotingsResponseImplCopyWithImpl(
      _$VotingsResponseImpl _value, $Res Function(_$VotingsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? voteType = freezed,
  }) {
    return _then(_$VotingsResponseImpl(
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
      voteType: freezed == voteType
          ? _value.voteType
          : voteType // ignore: cast_nullable_to_non_nullable
              as VoteType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VotingsResponseImpl implements _VotingsResponse {
  const _$VotingsResponseImpl(
      {this.id, this.createdAt, this.updatedAt, this.voteType});

  factory _$VotingsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VotingsResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final VoteType? voteType;

  @override
  String toString() {
    return 'VotingsResponse(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, voteType: $voteType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VotingsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.voteType, voteType) ||
                other.voteType == voteType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updatedAt, voteType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VotingsResponseImplCopyWith<_$VotingsResponseImpl> get copyWith =>
      __$$VotingsResponseImplCopyWithImpl<_$VotingsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VotingsResponseImplToJson(
      this,
    );
  }
}

abstract class _VotingsResponse implements VotingsResponse {
  const factory _VotingsResponse(
      {final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final VoteType? voteType}) = _$VotingsResponseImpl;

  factory _VotingsResponse.fromJson(Map<String, dynamic> json) =
      _$VotingsResponseImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  VoteType? get voteType;
  @override
  @JsonKey(ignore: true)
  _$$VotingsResponseImplCopyWith<_$VotingsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
