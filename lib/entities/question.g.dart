// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      survey: json['survey'] == null
          ? null
          : SurveyResponse.fromJson(json['survey'] as Map<String, dynamic>),
      fragestellung: json['fragestellung'] as String?,
      type: $enumDecodeNullable(_$QuestionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'survey': instance.survey,
      'fragestellung': instance.fragestellung,
      'type': _$QuestionTypeEnumMap[instance.type],
    };

const _$QuestionTypeEnumMap = {
  QuestionType.SKALA: 'SKALA',
  QuestionType.M_CHOICE: 'M_CHOICE',
  QuestionType.SATZ: 'SATZ',
};
