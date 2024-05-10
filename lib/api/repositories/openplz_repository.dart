import 'package:flutter_app/entities/street.dart';
import 'package:dio/dio.dart';
import '../clients/openplz_client.dart';
import '../common/api_result.dart';
import 'base_repository.dart';

class OpenplzRepository extends BaseRepository<OpenplzClient> {
  OpenplzRepository(String baseUrl, Dio dio)
      : super(client: OpenplzClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<List<Street>>> getStreets(
    String name,
    String locality,
    int page,
    int pageSize,
  ) async => execute(() => client.getStreets(name, locality, page, pageSize));
}
