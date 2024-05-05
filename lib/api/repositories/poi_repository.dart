import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/poi_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/poi.dart';

class PoiRepository extends BaseRepository<PoiClient> {

  PoiRepository(String baseUrl, Dio dio) : super(
    client: PoiClient(
        dio, baseUrl: 'https://api.partibremen.student.28apps-software.de'),
    dio: dio
  );

  Future<ApiResult<List<Poi>>> getPois() async {
    return execute(() => client.getAllPois());
  }


}