// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Poi _$PoiFromJson(Map<String, dynamic> json) {
  return _Poi.fromJson(json);
}

/// @nodoc
mixin _$Poi {
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get titel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PoiCopyWith<Poi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoiCopyWith<$Res> {
  factory $PoiCopyWith(Poi value, $Res Function(Poi) then) =
      _$PoiCopyWithImpl<$Res, Poi>;
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? description,
      bool? active,
      String? titel});
}

/// @nodoc
class _$PoiCopyWithImpl<$Res, $Val extends Poi> implements $PoiCopyWith<$Res> {
  _$PoiCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? active = freezed,
    Object? titel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoiImplCopyWith<$Res> implements $PoiCopyWith<$Res> {
  factory _$$PoiImplCopyWith(_$PoiImpl value, $Res Function(_$PoiImpl) then) =
      __$$PoiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? description,
      bool? active,
      String? titel});
}

/// @nodoc
class __$$PoiImplCopyWithImpl<$Res> extends _$PoiCopyWithImpl<$Res, _$PoiImpl>
    implements _$$PoiImplCopyWith<$Res> {
  __$$PoiImplCopyWithImpl(_$PoiImpl _value, $Res Function(_$PoiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? active = freezed,
    Object? titel = freezed,
  }) {
    return _then(_$PoiImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoiImpl implements _Poi {
  const _$PoiImpl(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.active,
      this.titel});

  factory _$PoiImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoiImplFromJson(json);

  @override
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? description;
  @override
  final bool? active;
  @override
  final String? titel;

  @override
  String toString() {
    return 'Poi(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, active: $active, titel: $titel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.titel, titel) || other.titel == titel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, description, active, titel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoiImplCopyWith<_$PoiImpl> get copyWith =>
      __$$PoiImplCopyWithImpl<_$PoiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoiImplToJson(
      this,
    );
  }
}

abstract class _Poi implements Poi {
  const factory _Poi(
      {final String? id,
      final String? createdAt,
      final String? updatedAt,
      final String? description,
      final bool? active,
      final String? titel}) = _$PoiImpl;

  factory _Poi.fromJson(Map<String, dynamic> json) = _$PoiImpl.fromJson;

  @override
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get description;
  @override
  bool? get active;
  @override
  String? get titel;
  @override
  @JsonKey(ignore: true)
  _$$PoiImplCopyWith<_$PoiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
