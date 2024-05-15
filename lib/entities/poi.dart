import 'dart:convert';

import 'package:flutter_app/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';
part 'poi.g.dart';

Poi poiFromJson(String str) => Poi.fromJson(json.decode(str));

String poiToJson(Poi data) => json.encode(data.toJson());

@freezed
class Poi with _$Poi {
  const factory Poi({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    bool? active,
    double? longitude,
    User? creator,
    dynamic reports,
    dynamic surveys,
    dynamic votings,
    dynamic comments,
    double? latitude,
    String? titel,
  }) = _Poi;

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}
