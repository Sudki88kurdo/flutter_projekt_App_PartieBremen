// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myPoi_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyPoiListState {
  MyPoiListStatus get status => throw _privateConstructorUsedError;
  List<Poi> get pois => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPoiListStateCopyWith<MyPoiListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPoiListStateCopyWith<$Res> {
  factory $MyPoiListStateCopyWith(
          MyPoiListState value, $Res Function(MyPoiListState) then) =
      _$MyPoiListStateCopyWithImpl<$Res, MyPoiListState>;
  @useResult
  $Res call({MyPoiListStatus status, List<Poi> pois, String? errorMessage});
}

/// @nodoc
class _$MyPoiListStateCopyWithImpl<$Res, $Val extends MyPoiListState>
    implements $MyPoiListStateCopyWith<$Res> {
  _$MyPoiListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pois = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyPoiListStatus,
      pois: null == pois
          ? _value.pois
          : pois // ignore: cast_nullable_to_non_nullable
              as List<Poi>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPoiListStateImplCopyWith<$Res>
    implements $MyPoiListStateCopyWith<$Res> {
  factory _$$MyPoiListStateImplCopyWith(_$MyPoiListStateImpl value,
          $Res Function(_$MyPoiListStateImpl) then) =
      __$$MyPoiListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MyPoiListStatus status, List<Poi> pois, String? errorMessage});
}

/// @nodoc
class __$$MyPoiListStateImplCopyWithImpl<$Res>
    extends _$MyPoiListStateCopyWithImpl<$Res, _$MyPoiListStateImpl>
    implements _$$MyPoiListStateImplCopyWith<$Res> {
  __$$MyPoiListStateImplCopyWithImpl(
      _$MyPoiListStateImpl _value, $Res Function(_$MyPoiListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pois = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MyPoiListStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyPoiListStatus,
      pois: null == pois
          ? _value._pois
          : pois // ignore: cast_nullable_to_non_nullable
              as List<Poi>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyPoiListStateImpl implements _MyPoiListState {
  const _$MyPoiListStateImpl(
      {this.status = MyPoiListStatus.initial,
      final List<Poi> pois = const [],
      this.errorMessage})
      : _pois = pois;

  @override
  @JsonKey()
  final MyPoiListStatus status;
  final List<Poi> _pois;
  @override
  @JsonKey()
  List<Poi> get pois {
    if (_pois is EqualUnmodifiableListView) return _pois;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pois);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MyPoiListState(status: $status, pois: $pois, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPoiListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._pois, _pois) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_pois), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPoiListStateImplCopyWith<_$MyPoiListStateImpl> get copyWith =>
      __$$MyPoiListStateImplCopyWithImpl<_$MyPoiListStateImpl>(
          this, _$identity);
}

abstract class _MyPoiListState implements MyPoiListState {
  const factory _MyPoiListState(
      {final MyPoiListStatus status,
      final List<Poi> pois,
      final String? errorMessage}) = _$MyPoiListStateImpl;

  @override
  MyPoiListStatus get status;
  @override
  List<Poi> get pois;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MyPoiListStateImplCopyWith<_$MyPoiListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
