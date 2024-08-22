import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/country.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://restcountries.com/v3.1")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/region/europe?fields=name,capital,flags,region,languages,population")
  Future<List<Country>> getEuropeanCountries();
}
