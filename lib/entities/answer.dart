import 'dart:convert';

import 'package:flutter_app/entities/question.dart';
import 'package:flutter_app/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

List<Answer> answerFromJson(String str) =>
    List<Answer>.from(json.decode(str).map((x) => Answer.fromJson(x)));

String answerToJson(List<Answer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Answer with _$Answer {
  const factory Answer({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    String? multipleChoiceAnswer,
    int? skalarAnswer,
    String? textAnswer,
    Question? question,
    User? answerer,
    String? titel,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
