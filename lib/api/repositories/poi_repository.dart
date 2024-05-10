import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/poi_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/poi.dart';

class PoiRepository extends BaseRepository<PoiClient> {
  PoiRepository(String baseUrl, Dio dio)
      : super(client: PoiClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<Poi>> findOne({required String poiId}) async {
    return execute(() => client.findOne(poiId: poiId));
  }

  Future<ApiResult<List<Poi>>> getPois() async {
    return execute(() => client.getAllPois());
  }

  Future<ApiResult<Poi>> create({
    required String title,
    required String description,
    required bool active,
    required String creatorId,
    required String latitude,
    required String longitude,
  }) async =>
      execute(
        () => client.create(
            title: title,
            description: description,
            active: true,
            creatorId: creatorId,
            latitude: latitude,
            longitude: longitude),
      );
}
