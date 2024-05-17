// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      dob: DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      password: json['password'] as String?,
      verified: json['verified'] as bool?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.DEFAULT,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
      'dob': instance.dob.toIso8601String(),
      'email': instance.email,
      'password': instance.password,
      'verified': instance.verified,
      'role': _$RoleEnumMap[instance.role],
      'active': instance.active,
    };

const _$RoleEnumMap = {
  Role.DEFAULT: 'DEFAULT',
  Role.USER: 'USER',
  Role.CREATOR: 'CREATOR',
  Role.MODERATOR: 'MODERATOR',
  Role.ADMIN: 'ADMIN',
  Role.DECIDER: 'DECIDER',
};
