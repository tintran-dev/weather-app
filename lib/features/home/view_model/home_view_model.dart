import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/respose/api_response.dart';
import 'package:weather_app/features/home/model/models.dart';
import 'package:weather_app/features/home/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  //Response loading
  ApiResponse<Weather> currentWeatherRes = ApiResponse.loading();
  ApiResponse<List<Weather>> forecastWeatherRes = ApiResponse.loading();
  ApiResponse<List<GeocodingModel>> geocoders = ApiResponse.idle();

//Setter method to pass a generic response
  _setCurrentWeatherRes(ApiResponse<Weather> res) {
    currentWeatherRes = res;
    notifyListeners();
  }

  Future<void> fetchCurrentWeatherApi(double lat, double lon) async {
    // _setCurrentWeatherRes(ApiResponse.loading());

    _myRepo.getCurrentWeatherByLocation(lat, lon).then((value) {
      _setCurrentWeatherRes(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        _setCurrentWeatherRes(ApiResponse.error(error.toString()));
        print(error);
      }
    });
  }

  _setForecastWeatherRes(ApiResponse<List<Weather>> res) {
    forecastWeatherRes = res;
    notifyListeners();
  }

  Future<void> fetchForecastWeatherApi(double lat, double lon) async {
    // _setCurrentWeatherRes(ApiResponse.loading());

    _myRepo.getForecastWeatherByLocation(lat, lon).then((value) {
      _setForecastWeatherRes(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        _setForecastWeatherRes(ApiResponse.error(error.toString()));
        print(error);
      }
    });
  }

  Future<List<GeocodingModel>?> searchCityName(String query) async {

    var res = await _myRepo.searchCityName(query).then((value) {
      geocoders = ApiResponse.completed(value);
      notifyListeners();
      return value;
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      return [];
    });
    return res;
  }
}
