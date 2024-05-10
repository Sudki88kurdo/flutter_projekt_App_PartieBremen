import 'dart:convert';
import 'package:flutter_app/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'street.freezed.dart';
part 'street.g.dart';

Street streetFromJson(String str) => Street.fromJson(json.decode(str));

String streetToJson(Street data) => json.encode(data.toJson());

@freezed
class Street with _$Street {
  const factory Street({
    String? name,
    String? locality,
    String? postalCode,
  }) = _Street;

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);
}
