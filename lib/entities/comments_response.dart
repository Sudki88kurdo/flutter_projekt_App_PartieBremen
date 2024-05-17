// To parse this JSON data, do
//
//     final commentsResponse = commentsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_app/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_response.freezed.dart';
part 'comments_response.g.dart';

List<CommentsResponse> commentsResponseFromJson(String str) =>
    List<CommentsResponse>.from(
        json.decode(str).map((x) => CommentsResponse.fromJson(x)));

String commentsResponseToJson(List<CommentsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? commenter,
    List<dynamic>? votings,
    List<dynamic>? comments,
    List<dynamic>? reports,
    String? actualcomment,
    List<dynamic>? voting,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}
