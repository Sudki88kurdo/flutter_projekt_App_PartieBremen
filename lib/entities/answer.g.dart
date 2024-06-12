// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      multipleChoiceAnswer: json['multipleChoiceAnswer'] as String?,
      skalarAnswer: (json['skalarAnswer'] as num?)?.toInt(),
      textAnswer: json['textAnswer'] as String?,
      question: json['question'] == null
          ? null
          : Question.fromJson(json['question'] as Map<String, dynamic>),
      answerer: json['answerer'] == null
          ? null
          : User.fromJson(json['answerer'] as Map<String, dynamic>),
      titel: json['titel'] as String?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'multipleChoiceAnswer': instance.multipleChoiceAnswer,
      'skalarAnswer': instance.skalarAnswer,
      'textAnswer': instance.textAnswer,
      'question': instance.question,
      'answerer': instance.answerer,
      'titel': instance.titel,
    };
