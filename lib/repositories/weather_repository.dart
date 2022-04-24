import 'package:weather_bloc/model/weather.dart';
import 'package:weather_bloc/networks/api_client.dart';

abstract class WeatherRepository {
  Future<WeatherResponse>? getDetailWeather();
}

class WeatherRepositoryImpl extends WeatherRepository {
  late ApiClient _apiClient;

  WeatherRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<WeatherResponse>? getDetailWeather() async {
    return await _apiClient.getDetailWeather();
  }
}