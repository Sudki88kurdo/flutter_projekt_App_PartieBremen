// To parse this JSON data, do
//
//     final votingsResponse = votingsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

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
    String? voteType,
  }) = _VotingsResponse;

  factory VotingsResponse.fromJson(Map<String, dynamic> json) =>
      _$VotingsResponseFromJson(json);
}
