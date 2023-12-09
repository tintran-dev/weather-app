import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/data/constant.dart';
import 'package:weather_app/core/respose/api_response.dart';
import 'package:weather_app/core/respose/status.dart';
import 'package:weather_app/features/home/model/models.dart';
import 'package:weather_app/features/home/view/widgets/widgets.dart';
import 'package:weather_app/resources/color.dart';
import 'package:weather_app/resources/components/round_buttons.dart';
import 'package:weather_app/shared/routes/routes_name.dart';
import 'package:weather_app/shared/widgets/widgets.dart';
import 'package:weather_app/features/home/view_model/home_view_model.dart';
import 'package:weather_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewViewModel _homeViewViewModel = HomeViewViewModel();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _homeViewViewModel.fetchCurrentWeatherApi(10.762622, 106.660172);
    _homeViewViewModel.fetchForecastWeatherApi(10.762622, 106.660172);
  }

  Widget _searchChild(String x) => Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          x,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.bgStartColor,
              AppColors.bgEndColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => _homeViewViewModel,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 36),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _searchBar(),
                  _currentWeather(),
                  _weatherHour(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Selector<HomeViewViewModel, ApiResponse<List<GeocodingModel>>>(
        selector: (_, p) => p.geocoders,
        builder: (_, ref, child) {
          List<SearchFieldListItem<GeocodingModel>> suggestions =
              ref.data == null
                  ? []
                  : ref.data!
                      .map((e) => SearchFieldListItem<GeocodingModel>(
                            e.name,
                            child: _searchChild(e.name),
                            item: e,
                          ))
                      .toList();

          return AppSearchField<GeocodingModel>(
            focusNode: _focusNode,
            suggestions: suggestions,
            onSearchTextChanged: (query) {
              _homeViewViewModel.searchCityName(query);

              return [];
            },
            onSuggestionTap: (SearchFieldListItem<GeocodingModel> x) {
              var geo = x.item;
              _homeViewViewModel.fetchCurrentWeatherApi(
                  geo?.lat ?? 0.0, geo?.lon ?? 0.0);
              _homeViewViewModel.fetchForecastWeatherApi(
                  geo?.lat ?? 0.0, geo?.lon ?? 0.0);
            },
          );
        },
      ),
    );
  }

  Selector<HomeViewViewModel, ApiResponse<Weather>> _currentWeather() {
    return Selector<HomeViewViewModel, ApiResponse<Weather>>(
      selector: (_, p) => p.currentWeatherRes,
      builder: (context, ref, child) {
        Widget child = Container();
        switch (ref.status ?? Status.idle) {
          case Status.loading:
            child = const Center(child: CircularProgressIndicator());
            break;
          case Status.error:
            return Container(
              decoration: BoxDecoration(
                color: AppColors.bgCardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(24),
              child: const Text(
                AppString.errorMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            );
          case Status.completed:
            var weather = ref.data!;
            child = WeatherCurrentCard(
              weather: weather,
            );

            break;
          default:
            break;
        }
        return child;
      },
    );
  }

  Widget _weatherHour() {
    return Selector<HomeViewViewModel, ApiResponse<List<Weather>>>(
      builder: (_, ref, child) {
        Widget child = Container();
        switch (ref.status ?? Status.idle) {
          case Status.loading:
            child = const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case Status.error:
            break;
          case Status.completed:
            var dNow = DateTime.now();

            var weathers = ref.data?.where((e) {
                  return e.date?.day == dNow.day;
                }).toList() ??
                [];

            child = Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppString.today,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      RoundButton(
                        title: AppString.nextFiveDays,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.forecast,
                            arguments: ref.data ?? [],
                          );
                        },
                        // loading: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    itemCount: weathers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      var weather = weathers[index];
                      return WeatherHourCard(
                        margin: EdgeInsets.only(
                          right: index == weathers.length - 1 ? 24 : 16,
                          left: index == 0 ? 24 : 0,
                        ),
                        time: weather.date == null
                            ? ''
                            : DateFormat().add_j().format(weather.date!),
                        weatherIcon:
                            getWeatherIcon(weather.weatherConditionCode!),
                        tempMax: "${weather.tempMax?.celsius?.round()}",
                      );
                    },
                  ),
                ),
              ],
            );
            break;
          default:
            break;
        }
        return child;
      },
      selector: (_, p) => p.forecastWeatherRes,
    );
  }
}
