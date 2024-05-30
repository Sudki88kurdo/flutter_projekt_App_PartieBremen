// To parse this JSON data, do
//
//     final surveyResponse = surveyResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_app/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

List<SurveyResponse> surveyResponseFromJson(String str) =>
    List<SurveyResponse>.from(
        json.decode(str).map((x) => SurveyResponse.fromJson(x)));

String surveyResponseToJson(List<SurveyResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class SurveyResponse with _$SurveyResponse {
  const factory SurveyResponse({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? titel,
    String? beschreibung,
    User? creator,
    DateTime? expiresAt,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);
}
