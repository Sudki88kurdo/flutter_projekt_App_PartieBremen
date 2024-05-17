import 'package:dio/dio.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_client.g.dart';

@RestApi()
abstract class CommentClient {
  factory CommentClient(Dio dio, {String baseUrl}) = _CommentClient;

  @GET("/comment/{poiId}/fromPoI")
  Future<HttpResponse<List<CommentsResponse>>> findAllFromPoI(
      {@Path("poiId") required String poiId});
}
