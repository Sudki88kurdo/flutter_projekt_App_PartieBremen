// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterPageState {
  ScreenStatus get status => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  bool get registerSuccessful => throw _privateConstructorUsedError;
  DateTime? get pickedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterPageStateCopyWith<RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPageStateCopyWith<$Res> {
  factory $RegisterPageStateCopyWith(
          RegisterPageState value, $Res Function(RegisterPageState) then) =
      _$RegisterPageStateCopyWithImpl<$Res, RegisterPageState>;
  @useResult
  $Res call(
      {ScreenStatus status,
      User? user,
      bool registerSuccessful,
      DateTime? pickedDate});

  $ScreenStatusCopyWith<$Res> get status;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$RegisterPageStateCopyWithImpl<$Res, $Val extends RegisterPageState>
    implements $RegisterPageStateCopyWith<$Res> {
  _$RegisterPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? registerSuccessful = null,
    Object? pickedDate = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      registerSuccessful: null == registerSuccessful
          ? _value.registerSuccessful
          : registerSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterPageStateImplCopyWith<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  factory _$$RegisterPageStateImplCopyWith(_$RegisterPageStateImpl value,
          $Res Function(_$RegisterPageStateImpl) then) =
      __$$RegisterPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenStatus status,
      User? user,
      bool registerSuccessful,
      DateTime? pickedDate});

  @override
  $ScreenStatusCopyWith<$Res> get status;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RegisterPageStateImplCopyWithImpl<$Res>
    extends _$RegisterPageStateCopyWithImpl<$Res, _$RegisterPageStateImpl>
    implements _$$RegisterPageStateImplCopyWith<$Res> {
  __$$RegisterPageStateImplCopyWithImpl(_$RegisterPageStateImpl _value,
      $Res Function(_$RegisterPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? registerSuccessful = null,
    Object? pickedDate = freezed,
  }) {
    return _then(_$RegisterPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      registerSuccessful: null == registerSuccessful
          ? _value.registerSuccessful
          : registerSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$RegisterPageStateImpl implements _RegisterPageState {
  const _$RegisterPageStateImpl(
      {this.status = const ScreenStatus.pure(),
      this.user = null,
      this.registerSuccessful = false,
      this.pickedDate = null});

  @override
  @JsonKey()
  final ScreenStatus status;
  @override
  @JsonKey()
  final User? user;
  @override
  @JsonKey()
  final bool registerSuccessful;
  @override
  @JsonKey()
  final DateTime? pickedDate;

  @override
  String toString() {
    return 'RegisterPageState(status: $status, user: $user, registerSuccessful: $registerSuccessful, pickedDate: $pickedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.registerSuccessful, registerSuccessful) ||
                other.registerSuccessful == registerSuccessful) &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, user, registerSuccessful, pickedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPageStateImplCopyWith<_$RegisterPageStateImpl> get copyWith =>
      __$$RegisterPageStateImplCopyWithImpl<_$RegisterPageStateImpl>(
          this, _$identity);
}

abstract class _RegisterPageState implements RegisterPageState {
  const factory _RegisterPageState(
      {final ScreenStatus status,
      final User? user,
      final bool registerSuccessful,
      final DateTime? pickedDate}) = _$RegisterPageStateImpl;

  @override
  ScreenStatus get status;
  @override
  User? get user;
  @override
  bool get registerSuccessful;
  @override
  DateTime? get pickedDate;
  @override
  @JsonKey(ignore: true)
  _$$RegisterPageStateImplCopyWith<_$RegisterPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
