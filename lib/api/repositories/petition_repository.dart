import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/petition_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/petition_response.dart';

class PetitionRepository extends BaseRepository<PetitionClient> {
  PetitionRepository(String baseUrl, Dio dio)
      : super(client: PetitionClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<PetitionResponse>> findOne({required String id}) async {
    return execute(() => client.findOne(id: id));
  }

  Future<ApiResult<List<PetitionResponse>>> findPOIsPetitions(
      {required String poiId}) async {
    return execute(() => client.getAllPetitions(poiId: poiId));
  }

  Future<ApiResult<PetitionResponse>> create({
    required String title,
    required String description,
    required DateTime expireAt,
    required int goal,
    required String poiId,
  }) async =>
      execute(
        () => client.createPetition(
          titel: title,
          description: description,
          expireAt: expireAt.toIso8601String(),
          goal: goal,
          poiId: poiId,
        ),
      );
}
