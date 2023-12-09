import 'package:flutter/material.dart';
import 'package:weather_app/resources/color.dart';

// ignore: must_be_immutable
class WeatherHourCard extends StatelessWidget {
  const WeatherHourCard({
    super.key,
    this.margin,
    required this.tempMax,
    required this.time,
    required this.weatherIcon,
  });

  final EdgeInsetsGeometry? margin;
  final String time;
  final String tempMax;
  final Widget weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin: margin,
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: weatherIcon,
          ),
          Text(
            "$tempMax °C",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
