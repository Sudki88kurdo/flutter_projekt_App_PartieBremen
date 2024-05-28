import 'package:dio/dio.dart';
import 'package:flutter_app/entities/votings_response.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:retrofit/retrofit.dart';

part 'voting_client.g.dart';

@RestApi()
abstract class VotingClient {
  factory VotingClient(Dio dio, {String baseUrl}) = _VotingClient;

  @POST("/voting")
  Future<HttpResponse<VotingsResponse>> createVote({
    @Field("voteType") required String voteType,
    @Field("voterId") required String voterId,
    @Field("poiId") String? poiId,
    @Field("commentId") String? commentId,
  });

  @GET("/voting/{poiId}/fromPoI")
  Future<HttpResponse<List<VotingsResponse>>> findAllFromPoI(
      {@Path("poiId") required String poiId});
}
