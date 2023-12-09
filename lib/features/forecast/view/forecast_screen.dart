import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/assets_gen/assets.gen.dart';
import 'package:weather_app/core/data/constant.dart';
import 'package:weather_app/resources/color.dart';
import 'package:weather_app/utils/utils.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({
    super.key,
    required this.weathers,
  });

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    List<Weather> items = [];
    var dNow = DateTime.now();
    for (var e in weathers.where((r) =>
        (r.date?.day ?? 1) > dNow.day || (r.date?.month ?? 1) > dNow.month)) {
      if (!items.any((r) => r.date?.day == e.date?.day)) {
        items.add(e);
      }
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
        child: items.isEmpty
            ? Container()
            : SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.bgCardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: getWeatherIcon(
                                      items[0].weatherConditionCode!),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      AppString.tommorow,
                                      style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Text(
                                        "${items[0].tempMax?.celsius?.round()} °C",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${items[0].weatherMain}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _card(
                                    Assets.wind.image(),
                                    items[0].windSpeed.toString(),
                                    AppString.windSpeed,
                                  ),
                                  _card(
                                    Assets.humidity.image(),
                                    items[0].humidity == null
                                        ? ""
                                        : "${items[0].humidity?.round()}%",
                                    AppString.humidity,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Table(
                        columnWidths: const {
                          0: IntrinsicColumnWidth(),
                          1: IntrinsicColumnWidth(flex: 0.5),
                          2: FlexColumnWidth(),
                          3: IntrinsicColumnWidth(flex: 0.2),
                          4: IntrinsicColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: items.map((e) {
                          return TableRow(children: [
                            Text(
                              e.date == null
                                  ? ""
                                  : DateFormat().add_E().format(e.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: getWeatherIcon(e.weatherConditionCode!),
                            ),
                            Text(
                              e.weatherMain ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${e.temperature?.celsius?.round()}°",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              e.humidity == null
                                  ? ""
                                  : "${e.humidity?.round()}%",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ]);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Column _card(
    Image image,
    String value,
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: image,
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
