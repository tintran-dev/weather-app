// ignore_for_file: constant_identifier_names

import 'package:weather_app/core/data/constant.dart';

class AppUrl {
  static const String URL_KEY_LAT = 'URL_KEY_LAT';
  static const String URL_KEY_CITY_NAME = 'URL_KEY_CITY_NAME';

  static String baseUrl = "http://api.openweathermap.org/";
  static String searchLocation =
      "${baseUrl}geo/1.0/direct?q=$URL_KEY_CITY_NAME&appid=$API_KEY";
}
