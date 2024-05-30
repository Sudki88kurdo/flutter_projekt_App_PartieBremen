// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyResponseImpl _$$SurveyResponseImplFromJson(Map<String, dynamic> json) =>
    _$SurveyResponseImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      titel: json['titel'] as String?,
      beschreibung: json['beschreibung'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$SurveyResponseImplToJson(
        _$SurveyResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'titel': instance.titel,
      'beschreibung': instance.beschreibung,
      'creator': instance.creator,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
