import 'package:dio/dio.dart';
import 'package:project2/app/constants.dart';
import 'package:retrofit/http.dart';

import '../responses/responses.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class AppServiceClient{
factory AppServiceClient(Dio dio , {required String baseUrl})= _AppServiceClient;
 @POST("user/login")
  Future<AuthenticationResponse>login();

}