part of 'detail_weather_cubit.dart';

// ignore: must_be_immutable
class DetailWeatherState extends Equatable {
  LoadStatus? loadStatus;
  WeatherResponse? result;
  bool expand;

  DetailWeatherState({
    this.loadStatus,
    this.result,
    this.expand = false,
  });

  DetailWeatherState copyWith({
    LoadStatus? loadStatus,
    WeatherResponse? result,
    bool? expand,
  }) {
    return DetailWeatherState(
      loadStatus: loadStatus ?? this.loadStatus,
      result: result ?? this.result,
      expand: expand ?? this.expand,
    );
  }

  @override
  List<Object?> get props => [
        loadStatus,
        result,
        expand,
      ];
}
