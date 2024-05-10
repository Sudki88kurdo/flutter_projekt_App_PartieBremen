// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poi_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoiViewState {
  ScreenStatus get status => throw _privateConstructorUsedError;
  Poi? get poi => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoiViewStateCopyWith<PoiViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoiViewStateCopyWith<$Res> {
  factory $PoiViewStateCopyWith(
          PoiViewState value, $Res Function(PoiViewState) then) =
      _$PoiViewStateCopyWithImpl<$Res, PoiViewState>;
  @useResult
  $Res call({ScreenStatus status, Poi? poi});

  $ScreenStatusCopyWith<$Res> get status;
  $PoiCopyWith<$Res>? get poi;
}

/// @nodoc
class _$PoiViewStateCopyWithImpl<$Res, $Val extends PoiViewState>
    implements $PoiViewStateCopyWith<$Res> {
  _$PoiViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? poi = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      poi: freezed == poi
          ? _value.poi
          : poi // ignore: cast_nullable_to_non_nullable
              as Poi?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get status {
    return $ScreenStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PoiCopyWith<$Res>? get poi {
    if (_value.poi == null) {
      return null;
    }

    return $PoiCopyWith<$Res>(_value.poi!, (value) {
      return _then(_value.copyWith(poi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PoiViewStateImplCopyWith<$Res>
    implements $PoiViewStateCopyWith<$Res> {
  factory _$$PoiViewStateImplCopyWith(
          _$PoiViewStateImpl value, $Res Function(_$PoiViewStateImpl) then) =
      __$$PoiViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreenStatus status, Poi? poi});

  @override
  $ScreenStatusCopyWith<$Res> get status;
  @override
  $PoiCopyWith<$Res>? get poi;
}

/// @nodoc
class __$$PoiViewStateImplCopyWithImpl<$Res>
    extends _$PoiViewStateCopyWithImpl<$Res, _$PoiViewStateImpl>
    implements _$$PoiViewStateImplCopyWith<$Res> {
  __$$PoiViewStateImplCopyWithImpl(
      _$PoiViewStateImpl _value, $Res Function(_$PoiViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? poi = freezed,
  }) {
    return _then(_$PoiViewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      poi: freezed == poi
          ? _value.poi
          : poi // ignore: cast_nullable_to_non_nullable
              as Poi?,
    ));
  }
}

/// @nodoc

class _$PoiViewStateImpl implements _PoiViewState {
  const _$PoiViewStateImpl(
      {this.status = const ScreenStatus.pure(), this.poi = null});

  @override
  @JsonKey()
  final ScreenStatus status;
  @override
  @JsonKey()
  final Poi? poi;

  @override
  String toString() {
    return 'PoiViewState(status: $status, poi: $poi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoiViewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.poi, poi) || other.poi == poi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, poi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoiViewStateImplCopyWith<_$PoiViewStateImpl> get copyWith =>
      __$$PoiViewStateImplCopyWithImpl<_$PoiViewStateImpl>(this, _$identity);
}

abstract class _PoiViewState implements PoiViewState {
  const factory _PoiViewState({final ScreenStatus status, final Poi? poi}) =
      _$PoiViewStateImpl;

  @override
  ScreenStatus get status;
  @override
  Poi? get poi;
  @override
  @JsonKey(ignore: true)
  _$$PoiViewStateImplCopyWith<_$PoiViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
