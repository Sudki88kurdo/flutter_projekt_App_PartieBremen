import 'package:dio/dio.dart';
import 'package:flutter_app/entities/signature.dart';
import 'package:retrofit/retrofit.dart';

part 'signature_client.g.dart';

@RestApi()
abstract class SignatureClient {
  factory SignatureClient(Dio dio, {String baseUrl}) = _SignatureClient;

  @POST("/signature")
  Future<HttpResponse<Signature>> create({
    @Field("signerId") required String signerId,
    @Field("petitionId") required String petitionId,
  });
}
