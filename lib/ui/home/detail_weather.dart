import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/model/load_status.dart';
import 'package:weather_bloc/ui/home/detail_weather_big.dart';

import '../../bloc/detail_weather_cubit.dart';
import 'detail_weather_small.dart';

class DetailWeatherScreen extends StatefulWidget {
  const DetailWeatherScreen({Key? key}) : super(key: key);

  @override
  State<DetailWeatherScreen> createState() => _DetailWeatherScreenState();
}

class _DetailWeatherScreenState extends State<DetailWeatherScreen> {
  bool expand = false;
  late DetailWeatherCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<DetailWeatherCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailWeatherCubit, DetailWeatherState>(
          bloc: BlocProvider.of<DetailWeatherCubit>(context),
          listenWhen: (prev, state) => prev != state,
          listener: (context, state) {},
          buildWhen: (prev, state) => prev != state,
          builder: (context, state) {
            return SingleChildScrollView(
              physics: state.expand
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    child: state.expand
                        ? DetailWeatherSmallScreen()
                        : DetailWeatherBigScreen(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 140,
                    color: const Color(0xFF2C79C1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            'Saturday | Apr 16',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          margin: const EdgeInsets.only(left: 16, top: 9),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 72,
                                height: 104,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'time',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Image.asset(
                                      'assets/images/ic_weather-partly-cloudy-night.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'temperature',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'percent',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<DetailWeatherCubit, DetailWeatherState>(
                    buildWhen: (prev, current) => prev.expand != current.expand,
                    builder: (context, state) {
                      return state.expand
                          ? InkWell(
                              onTap: () {
                                _cubit.expandForcats();
                                print(_cubit);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 16, right: 16, bottom: 16),
                                color: const Color(0xFF2C79C1),
                                height: 379,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Forcats for 7 Days',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'title',
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Image.asset(
                                                        'assets/images/ic_weather-partly-cloudy-night.png'),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'percent',
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Text(
                                                      'temperature',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                width: 390,
                                                height: 48,
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                _cubit.expandForcats();
                                print(_cubit);
                              },
                              child: Ink(
                                width: 167,
                                height: 24,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Forcats for 7 Days',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2C79C1),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/ic_arrow.png',
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
