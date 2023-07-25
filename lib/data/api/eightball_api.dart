import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:surf_practice_magic_ball/data/api/eightball_response.dart';

part 'eightball_api.g.dart';

@RestApi(baseUrl: "https://eightballapi.com/api")
abstract class EightballApi {
  factory EightballApi(Dio dio, {String baseUrl}) = _EightballApi;

  @GET("/")
  Future<EightballResponse> getRandomReading();
}
