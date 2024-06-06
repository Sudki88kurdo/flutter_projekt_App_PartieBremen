import 'package:dio/dio.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_client.g.dart';

@RestApi()
abstract class CommentClient {
  factory CommentClient(Dio dio, {String baseUrl}) = _CommentClient;

  @POST("/comment")
  Future<HttpResponse<CommentsResponse>> writeComment({
    @Field("actualComment") required String actualComment,
    @Field("commenterId") required String commenterId,
    @Field("poiId") String? poiId,
    @Field("commentId") String? commentId,
  });

  @GET("/comment/{poiId}/fromPoI")
  Future<HttpResponse<List<CommentsResponse>>> findAllFromPoI(
      {@Path("poiId") required String poiId});

  @GET("/comment/user/{userId}")
  Future<HttpResponse<List<CommentsResponse>>> findUserComments({
    @Path("userId") required String userId,
  });
}