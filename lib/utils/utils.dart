import 'package:flutter/material.dart';
import 'package:weather_app/core/assets_gen/assets.gen.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Assets.storm.image();
    case >= 300 && < 400:
      return Assets.rain.image();
    case >= 500 && < 600:
      return Assets.rainy.image();
    case >= 600 && < 700:
      return Assets.snowy.image();
    case >= 700 && < 800:
      return Assets.windy.image();
    case == 800:
      return Assets.sun.image();
    case > 800 && <= 804:
      return Assets.sunny.image();
    default:
      return Assets.sunny.image();
  }
}
