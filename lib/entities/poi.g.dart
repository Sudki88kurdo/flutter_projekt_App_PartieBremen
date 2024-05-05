// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoiImpl _$$PoiImplFromJson(Map<String, dynamic> json) => _$PoiImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      description: json['description'] as String?,
      active: json['active'] as bool?,
      titel: json['titel'] as String?,
    );

Map<String, dynamic> _$$PoiImplToJson(_$PoiImpl instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'active': instance.active,
      'titel': instance.titel,
    };
