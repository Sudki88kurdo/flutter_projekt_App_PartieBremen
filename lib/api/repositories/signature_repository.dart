import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/signature_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/signature.dart';

class SignatureRepository extends BaseRepository<SignatureClient> {
  SignatureRepository(String baseUrl, Dio dio)
      : super(client: SignatureClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<Signature>> create({
    required String signerId,
    required String petitionId,
  }) async =>
      execute(
        () => client.create(signerId: signerId, petitionId: petitionId),
      );
}
