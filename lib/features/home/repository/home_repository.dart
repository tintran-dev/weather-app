import 'package:weather/weather.dart';
import 'package:weather_app/core/data/constant.dart';
import 'package:weather_app/core/network/base_api_services.dart';
import 'package:weather_app/core/network/network_api_services.dart';
import 'package:weather_app/features/home/model/models.dart';
import 'package:weather_app/resources/app_urls.dart';

class HomeRepository {
  BaseApiServices apiServices = NetworkApiService();
  Future<Weather> getCurrentWeatherByLocation(double lat, double lon) async {
    try {
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

      Weather weather = await wf.currentWeatherByLocation(lat, lon);

      return weather;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Weather>> getForecastWeatherByLocation(
      double lat, double lon) async {
    try {
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

      List<Weather> weathers = await wf.fiveDayForecastByLocation(lat, lon);

      return weathers;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<GeocodingModel>> searchCityName(String query) async {
    try {
      var url =
          AppUrl.searchLocation.replaceAll(AppUrl.URL_KEY_CITY_NAME, query);
      dynamic res = await apiServices.getApiResponse(url);
      var data =
          List<GeocodingModel>.from(res.map((x) => GeocodingModel.fromJson(x)));

      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
