import 'package:dio/dio.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/votings_response.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';

import '../clients/voting_client.dart';

class VotingRepository extends BaseRepository<VotingClient> {
  VotingRepository(String baseUrl, Dio dio)
      : super(client: VotingClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<VotingsResponse>> createVoting({
    required VoteType voteType,
    required String voterId,
    String? poiId,
    String? commentId,
  }) async {
    return execute(() => client.createVote(
        voteType: voteType.name,
        voterId: voterId,
        poiId: poiId,
        commentId: commentId));
  }

  Future<ApiResult<List<VotingsResponse>>> findAllFromPoI(
      {required String poiId}) async {
    return execute(() => client.findAllFromPoI(poiId: poiId));
  }
}
