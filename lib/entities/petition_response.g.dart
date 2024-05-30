// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetitionResponseImpl _$$PetitionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PetitionResponseImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      titel: json['titel'] as String?,
      description: json['description'] as String?,
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      goal: (json['goal'] as num?)?.toInt(),
      poiId: json['poiId'] as String?,
    );

Map<String, dynamic> _$$PetitionResponseImplToJson(
        _$PetitionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'titel': instance.titel,
      'description': instance.description,
      'expireAt': instance.expireAt?.toIso8601String(),
      'goal': instance.goal,
      'poiId': instance.poiId,
    };
