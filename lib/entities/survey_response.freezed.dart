// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) {
  return _SurveyResponse.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponse {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get titel => throw _privateConstructorUsedError;
  String? get beschreibung => throw _privateConstructorUsedError;
  User? get creator => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyResponseCopyWith<SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseCopyWith<$Res> {
  factory $SurveyResponseCopyWith(
          SurveyResponse value, $Res Function(SurveyResponse) then) =
      _$SurveyResponseCopyWithImpl<$Res, SurveyResponse>;
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? titel,
      String? beschreibung,
      User? creator,
      DateTime? expiresAt});

  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class _$SurveyResponseCopyWithImpl<$Res, $Val extends SurveyResponse>
    implements $SurveyResponseCopyWith<$Res> {
  _$SurveyResponseCopyWithImpl(this._value, this._then);

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
    Object? titel = freezed,
    Object? beschreibung = freezed,
    Object? creator = freezed,
    Object? expiresAt = freezed,
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
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      beschreibung: freezed == beschreibung
          ? _value.beschreibung
          : beschreibung // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SurveyResponseImplCopyWith<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  factory _$$SurveyResponseImplCopyWith(_$SurveyResponseImpl value,
          $Res Function(_$SurveyResponseImpl) then) =
      __$$SurveyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? titel,
      String? beschreibung,
      User? creator,
      DateTime? expiresAt});

  @override
  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class __$$SurveyResponseImplCopyWithImpl<$Res>
    extends _$SurveyResponseCopyWithImpl<$Res, _$SurveyResponseImpl>
    implements _$$SurveyResponseImplCopyWith<$Res> {
  __$$SurveyResponseImplCopyWithImpl(
      _$SurveyResponseImpl _value, $Res Function(_$SurveyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? titel = freezed,
    Object? beschreibung = freezed,
    Object? creator = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_$SurveyResponseImpl(
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
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      beschreibung: freezed == beschreibung
          ? _value.beschreibung
          : beschreibung // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyResponseImpl implements _SurveyResponse {
  const _$SurveyResponseImpl(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.titel,
      this.beschreibung,
      this.creator,
      this.expiresAt});

  factory _$SurveyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? titel;
  @override
  final String? beschreibung;
  @override
  final User? creator;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'SurveyResponse(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, titel: $titel, beschreibung: $beschreibung, creator: $creator, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.titel, titel) || other.titel == titel) &&
            (identical(other.beschreibung, beschreibung) ||
                other.beschreibung == beschreibung) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, titel,
      beschreibung, creator, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      __$$SurveyResponseImplCopyWithImpl<_$SurveyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyResponseImplToJson(
      this,
    );
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  const factory _SurveyResponse(
      {final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? titel,
      final String? beschreibung,
      final User? creator,
      final DateTime? expiresAt}) = _$SurveyResponseImpl;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$SurveyResponseImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get titel;
  @override
  String? get beschreibung;
  @override
  User? get creator;
  @override
  DateTime? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
