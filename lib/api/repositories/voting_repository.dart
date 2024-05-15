import 'package:dio/dio.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/votings_response.dart';

import '../clients/voting_client.dart';

class VotingRepository extends BaseRepository<VotingClient> {
  VotingRepository(String baseUrl, Dio dio)
      : super(client: VotingClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<List<VotingsResponse>>> findAllFromPoI(
      {required String poiId}) async {
    return execute(() => client.findAllFromPoI(poiId: poiId));
  }
}
