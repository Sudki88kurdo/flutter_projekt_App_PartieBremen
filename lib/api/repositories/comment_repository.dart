import 'package:dio/dio.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/comments_response.dart';

import '../clients/comment_client.dart';

class CommentRepository extends BaseRepository<CommentClient> {
  CommentRepository(String baseUrl, Dio dio)
      : super(client: CommentClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<List<CommentsResponse>>> findAllFromPoI(
      {required String poiId}) async {
    return execute(() => client.findAllFromPoI(poiId: poiId));
  }
}
