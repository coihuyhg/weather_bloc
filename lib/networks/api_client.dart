import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_bloc/model/weather.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/data/2.5/weather?lat=21.0227788&lon=105.8194541&appid=6eda658a30b6a7f9d2050af7a8fb2d72&units=metric')
  Future<WeatherResponse> getDetailWeather();
}
