import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/assets_gen/assets.gen.dart';
import 'package:weather_app/core/data/constant.dart';
import 'package:weather_app/resources/color.dart';
import 'package:weather_app/utils/utils.dart';

// ignore: must_be_immutable
class WeatherCurrentCard extends StatelessWidget {
  const WeatherCurrentCard({
    super.key,
    required this.weather,
    this.onPress,
  });

  final Weather weather;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: getWeatherIcon(weather.weatherConditionCode!),
        ),
        Text(
          weather.areaName ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            '${weather.temperature?.celsius?.round()}°C',
            style: const TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            weather.weatherMain?.toUpperCase() ?? '',
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            weather.date == null
                ? ''
                : DateFormat('EEEE dd •').add_jm().format(weather.date!),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _TemperatureWidget(weather: weather),
      ],
    );
  }
}

class _TemperatureWidget extends StatelessWidget {
  const _TemperatureWidget({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Assets.sunrise.image(scale: 8),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.sunrise,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        weather.sunrise == null
                            ? ''
                            : DateFormat().add_jm().format(weather.sunrise!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Assets.sunset.image(scale: 8),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.sunset,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        weather.sunset == null
                            ? ''
                            : DateFormat().add_jm().format(weather.sunset!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Assets.highTemperature.image(scale: 8),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppString.tempMax,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${weather.tempMax?.celsius?.round()} °C",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ]),
              Row(
                children: [
                  Assets.lowTemperature.image(scale: 8),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.tempMin,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${weather.tempMin?.celsius?.round()} °C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
