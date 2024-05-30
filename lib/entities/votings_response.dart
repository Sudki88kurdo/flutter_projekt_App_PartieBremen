// To parse this JSON data, do
//
//     final votingsResponse = votingsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_app/entities/user.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'votings_response.freezed.dart';
part 'votings_response.g.dart';

List<VotingsResponse> votingsResponseFromJson(String str) =>
    List<VotingsResponse>.from(
        json.decode(str).map((x) => VotingsResponse.fromJson(x)));

String votingsResponseToJson(List<VotingsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class VotingsResponse with _$VotingsResponse {
  const factory VotingsResponse({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    VoteType? voteType,
  }) = _VotingsResponse;

  factory VotingsResponse.fromJson(Map<String, dynamic> json) =>
      _$VotingsResponseFromJson(json);
}
