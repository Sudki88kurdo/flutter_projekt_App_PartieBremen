// To parse this JSON data, do
//
//     final signature = signatureFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature.freezed.dart';
part 'signature.g.dart';

List<Signature> signatureFromJson(String str) =>
    List<Signature>.from(json.decode(str).map((x) => Signature.fromJson(x)));

String signatureToJson(List<Signature> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Signature with _$Signature {
  const factory Signature({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) = _Signature;

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);
}
