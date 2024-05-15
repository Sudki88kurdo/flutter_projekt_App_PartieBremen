// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsResponseImpl _$$CommentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentsResponseImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      commenter: json['commenter'] == null
          ? null
          : User.fromJson(json['commenter'] as Map<String, dynamic>),
      votings: json['votings'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      reports: json['reports'] as List<dynamic>?,
      actualcomment: json['actualcomment'] as String?,
      voting: json['voting'] as List<dynamic>?,
    );

Map<String, dynamic> _$$CommentsResponseImplToJson(
        _$CommentsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'commenter': instance.commenter,
      'votings': instance.votings,
      'comments': instance.comments,
      'reports': instance.reports,
      'actualcomment': instance.actualcomment,
      'voting': instance.voting,
    };
