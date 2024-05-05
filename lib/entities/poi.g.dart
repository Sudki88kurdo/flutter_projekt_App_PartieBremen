// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoiImpl _$$PoiImplFromJson(Map<String, dynamic> json) => _$PoiImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
      active: json['active'] as bool?,
      longitude: json['longitude'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      reports: json['reports'],
      surveys: json['surveys'],
      votings: json['votings'],
      comments: json['comments'],
      latitude: json['latitude'] as String?,
      titel: json['titel'] as String?,
    );

Map<String, dynamic> _$$PoiImplToJson(_$PoiImpl instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'active': instance.active,
      'longitude': instance.longitude,
      'creator': instance.creator,
      'reports': instance.reports,
      'surveys': instance.surveys,
      'votings': instance.votings,
      'comments': instance.comments,
      'latitude': instance.latitude,
      'titel': instance.titel,
    };
