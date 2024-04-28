import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';

import '../common/api_result.dart';
import '../common/network_exceptions.dart';

class BaseRepository<C> {
  /// Dio instance to use for requests
  final Dio dio;

  /// Client eg. [AuthClient] or [MapClient] etc. to use for requests
  final C client;


  BaseRepository({
    required this.dio,
    required this.client,
  });


  @protected
  Future<ApiResult<T>> execute<T, F extends HttpResponse<T>>(
      Future<F> Function() fetchFuture,
      ) async {
    try {
      final response = await fetchFuture();
      return ApiResult.success(data: response.data);
    } catch (e, stacktrace) {
      print("Failed with $e and stacktrace $stacktrace");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}