import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/detail_weather_cubit.dart';
import 'package:weather_bloc/networks/api_client.dart';
import 'package:weather_bloc/networks/api_util.dart';
import 'package:weather_bloc/repositories/weather_repository.dart';
import 'package:weather_bloc/ui/home/detail_weather.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;

  @override
  void initState() {
    _apiClient = ApiUtil.instance.apiClient;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (context) {
            return WeatherRepositoryImpl(_apiClient);
          },
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DetailWeatherCubit>(
            create: (context) {
              final repository =
                  RepositoryProvider.of<WeatherRepository>(context);
              return DetailWeatherCubit(repository);
            },
          )
        ],
        child: Builder(
          builder: (context) {
            return DetailWeatherScreen();
          },
        ),
      ),
    );
  }
}
