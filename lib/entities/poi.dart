import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.g.dart';

part 'poi.freezed.dart';

@freezed
class Poi with _$Poi {
  const factory Poi({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? description,
    bool? active,
    String? titel
  }) = _Poi;

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}
