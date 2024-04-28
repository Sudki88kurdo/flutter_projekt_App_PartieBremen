// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartPageState {
  ScreenStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartPageStateCopyWith<StartPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartPageStateCopyWith<$Res> {
  factory $StartPageStateCopyWith(
          StartPageState value, $Res Function(StartPageState) then) =
      _$StartPageStateCopyWithImpl<$Res, StartPageState>;
  @useResult
  $Res call({ScreenStatus status});

  $ScreenStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$StartPageStateCopyWithImpl<$Res, $Val extends StartPageState>
    implements $StartPageStateCopyWith<$Res> {
  _$StartPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get status {
    return $ScreenStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartPageStateImplCopyWith<$Res>
    implements $StartPageStateCopyWith<$Res> {
  factory _$$StartPageStateImplCopyWith(_$StartPageStateImpl value,
          $Res Function(_$StartPageStateImpl) then) =
      __$$StartPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreenStatus status});

  @override
  $ScreenStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$StartPageStateImplCopyWithImpl<$Res>
    extends _$StartPageStateCopyWithImpl<$Res, _$StartPageStateImpl>
    implements _$$StartPageStateImplCopyWith<$Res> {
  __$$StartPageStateImplCopyWithImpl(
      _$StartPageStateImpl _value, $Res Function(_$StartPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$StartPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ));
  }
}

/// @nodoc

class _$StartPageStateImpl implements _StartPageState {
  const _$StartPageStateImpl({this.status = const ScreenStatus.pure()});

  @override
  @JsonKey()
  final ScreenStatus status;

  @override
  String toString() {
    return 'StartPageState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartPageStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartPageStateImplCopyWith<_$StartPageStateImpl> get copyWith =>
      __$$StartPageStateImplCopyWithImpl<_$StartPageStateImpl>(
          this, _$identity);
}

abstract class _StartPageState implements StartPageState {
  const factory _StartPageState({final ScreenStatus status}) =
      _$StartPageStateImpl;

  @override
  ScreenStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$StartPageStateImplCopyWith<_$StartPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
