// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'votings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VotingsResponseImpl _$$VotingsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VotingsResponseImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      voteType: $enumDecodeNullable(_$VoteTypeEnumMap, json['voteType']),
    );

Map<String, dynamic> _$$VotingsResponseImplToJson(
        _$VotingsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'voteType': _$VoteTypeEnumMap[instance.voteType],
    };

const _$VoteTypeEnumMap = {
  VoteType.UP: 'UP',
  VoteType.DOWN: 'DOWN',
};
