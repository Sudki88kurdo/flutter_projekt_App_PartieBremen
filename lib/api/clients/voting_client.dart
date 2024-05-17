import 'package:dio/dio.dart';
import 'package:flutter_app/entities/votings_response.dart';
import 'package:retrofit/retrofit.dart';

part 'voting_client.g.dart';

@RestApi()
abstract class VotingClient {
  factory VotingClient(Dio dio, {String baseUrl}) = _VotingClient;

  @GET("/voting/{poiId}/fromPoI")
  Future<HttpResponse<List<VotingsResponse>>> findAllFromPoI(
      {@Path("poiId") required String poiId});
}
