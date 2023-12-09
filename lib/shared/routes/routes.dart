import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/features/forecast/view/forecast_screen.dart';
import 'package:weather_app/shared/routes/routes_name.dart';
import 'package:weather_app/features/home/view/home_screen.dart';

class Routes {
  //settings accept string parameter
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.forecast:
        var params = settings.arguments as List<Weather>;
        return MaterialPageRoute(
          builder: (BuildContext context) => ForecastScreen(
            weathers: params,
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
