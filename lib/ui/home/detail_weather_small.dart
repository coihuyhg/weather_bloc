import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/detail_weather_cubit.dart';
import '../manage_location/manage_location.dart';
import '../setting/setting.dart';

class DetailWeatherSmallScreen extends StatefulWidget {
  const DetailWeatherSmallScreen({Key? key}) : super(key: key);

  @override
  State<DetailWeatherSmallScreen> createState() =>
      _DetailWeatherSmallScreenState();
}

class _DetailWeatherSmallScreenState extends State<DetailWeatherSmallScreen> {
  late DetailWeatherCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<DetailWeatherCubit>(context);
    // TODO: implement initState
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailWeatherCubit, DetailWeatherState>(
      bloc: _cubit,
      buildWhen: (prev, current) => prev.loadStatus != current.loadStatus,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 36, right: 16),
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
            ),
          ),
          width: 358,
          height: 353,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ManageLocation(),
                          ));
                    },
                    icon: Image.asset(
                      'assets/images/ic_plus.png',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 61,
                    height: 32,
                    child: Column(
                      children: [
                        Text(
                          state.result?.name ?? '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              width: 8,
                              height: 8,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              width: 8,
                              height: 8,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              width: 8,
                              height: 8,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    icon: Image.asset(
                      'assets/images/ic_menu.png',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text(
                          "Share",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF1B2541),
                          ),
                        ),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF1B2541),
                          ),
                        ),
                        value: 1,
                        onTap: () {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Setting();
                                },
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/image.png',
                    width: 160,
                    height: 160,
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Saturday | Apr 16',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${state.result?.main?.temp?.round()}°',
                        style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Heavy rain',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                  ),
                ),
                width: 326,
                height: 105,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/ic_location.png',
                          width: 32,
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.result?.wind?.speed} km/h',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                            const Text(
                              'Wind',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/ic_weather-rain.png',
                          width: 32,
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.result?.clouds?.all}%',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                            const Text(
                              'Cloud chance',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/ic_temperature.png',
                          width: 32,
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.result?.main?.pressure} mbar',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                            const Text(
                              'Pressure',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/ic_water.png',
                          width: 32,
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.result?.main?.humidity}%',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              'Humidity ${state.result?.main?.humidity}%',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
