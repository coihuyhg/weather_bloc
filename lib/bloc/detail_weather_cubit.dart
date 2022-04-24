import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/model/load_status.dart';
import 'package:weather_bloc/model/weather.dart';
import 'package:weather_bloc/repositories/weather_repository.dart';
part 'detail_weather_state.dart';

class DetailWeatherCubit extends Cubit<DetailWeatherState> {
  WeatherRepository weatherRepository;

  DetailWeatherCubit(this.weatherRepository) : super(DetailWeatherState());

  void init() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final result = await weatherRepository.getDetailWeather();
      if (result != null) {
        emit(state.copyWith(result: result, loadStatus: LoadStatus.success));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  void expandForcats() {
    emit(state.copyWith(expand: true));
  }
}