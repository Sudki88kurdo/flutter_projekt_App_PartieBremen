// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get multipleChoiceAnswer => throw _privateConstructorUsedError;
  int? get skalarAnswer => throw _privateConstructorUsedError;
  String? get textAnswer => throw _privateConstructorUsedError;
  Question? get question => throw _privateConstructorUsedError;
  User? get answerer => throw _privateConstructorUsedError;
  String? get titel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isDeleted,
      String? multipleChoiceAnswer,
      int? skalarAnswer,
      String? textAnswer,
      Question? question,
      User? answerer,
      String? titel});

  $QuestionCopyWith<$Res>? get question;
  $UserCopyWith<$Res>? get answerer;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

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
    Object? isDeleted = freezed,
    Object? multipleChoiceAnswer = freezed,
    Object? skalarAnswer = freezed,
    Object? textAnswer = freezed,
    Object? question = freezed,
    Object? answerer = freezed,
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
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleChoiceAnswer: freezed == multipleChoiceAnswer
          ? _value.multipleChoiceAnswer
          : multipleChoiceAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      skalarAnswer: freezed == skalarAnswer
          ? _value.skalarAnswer
          : skalarAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question?,
      answerer: freezed == answerer
          ? _value.answerer
          : answerer // ignore: cast_nullable_to_non_nullable
              as User?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res>? get question {
    if (_value.question == null) {
      return null;
    }

    return $QuestionCopyWith<$Res>(_value.question!, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get answerer {
    if (_value.answerer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.answerer!, (value) {
      return _then(_value.copyWith(answerer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isDeleted,
      String? multipleChoiceAnswer,
      int? skalarAnswer,
      String? textAnswer,
      Question? question,
      User? answerer,
      String? titel});

  @override
  $QuestionCopyWith<$Res>? get question;
  @override
  $UserCopyWith<$Res>? get answerer;
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? multipleChoiceAnswer = freezed,
    Object? skalarAnswer = freezed,
    Object? textAnswer = freezed,
    Object? question = freezed,
    Object? answerer = freezed,
    Object? titel = freezed,
  }) {
    return _then(_$AnswerImpl(
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleChoiceAnswer: freezed == multipleChoiceAnswer
          ? _value.multipleChoiceAnswer
          : multipleChoiceAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      skalarAnswer: freezed == skalarAnswer
          ? _value.skalarAnswer
          : skalarAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question?,
      answerer: freezed == answerer
          ? _value.answerer
          : answerer // ignore: cast_nullable_to_non_nullable
              as User?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.multipleChoiceAnswer,
      this.skalarAnswer,
      this.textAnswer,
      this.question,
      this.answerer,
      this.titel});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? isDeleted;
  @override
  final String? multipleChoiceAnswer;
  @override
  final int? skalarAnswer;
  @override
  final String? textAnswer;
  @override
  final Question? question;
  @override
  final User? answerer;
  @override
  final String? titel;

  @override
  String toString() {
    return 'Answer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, multipleChoiceAnswer: $multipleChoiceAnswer, skalarAnswer: $skalarAnswer, textAnswer: $textAnswer, question: $question, answerer: $answerer, titel: $titel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.multipleChoiceAnswer, multipleChoiceAnswer) ||
                other.multipleChoiceAnswer == multipleChoiceAnswer) &&
            (identical(other.skalarAnswer, skalarAnswer) ||
                other.skalarAnswer == skalarAnswer) &&
            (identical(other.textAnswer, textAnswer) ||
                other.textAnswer == textAnswer) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answerer, answerer) ||
                other.answerer == answerer) &&
            (identical(other.titel, titel) || other.titel == titel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      isDeleted,
      multipleChoiceAnswer,
      skalarAnswer,
      textAnswer,
      question,
      answerer,
      titel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? isDeleted,
      final String? multipleChoiceAnswer,
      final int? skalarAnswer,
      final String? textAnswer,
      final Question? question,
      final User? answerer,
      final String? titel}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get isDeleted;
  @override
  String? get multipleChoiceAnswer;
  @override
  int? get skalarAnswer;
  @override
  String? get textAnswer;
  @override
  Question? get question;
  @override
  User? get answerer;
  @override
  String? get titel;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
