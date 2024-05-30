// To parse this JSON data, do
//
//     final petitionResponse = petitionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_response.freezed.dart';
part 'petition_response.g.dart';

List<PetitionResponse> petitionResponseFromJson(String str) =>
    List<PetitionResponse>.from(
        json.decode(str).map((x) => PetitionResponse.fromJson(x)));

String petitionResponseToJson(List<PetitionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class PetitionResponse with _$PetitionResponse {
  const factory PetitionResponse({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? titel,
    String? description,
    DateTime? expireAt,
    int? goal,
    String? poiId,
  }) = _PetitionResponse;

  factory PetitionResponse.fromJson(Map<String, dynamic> json) =>
      _$PetitionResponseFromJson(json);
}
