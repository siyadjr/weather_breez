import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';

import 'package:weatherbreez/view/weather/widgets/current_weather_card.dart';
import 'package:weatherbreez/view/weather/widgets/weather_details_grid.dart';

class WeatherContent extends StatelessWidget {
  final dynamic weatherData;
  final AppColours colours;

  const WeatherContent({
    super.key,
    required this.weatherData,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colours.mainBackGroundColor,
            colours.mainBackGroundColor.withOpacity(0.7),
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentWeatherCard(
              weatherData: weatherData,
              colours: colours,
            ),
            const SizedBox(height: 20),
            WeatherDetailsGrid(
              weatherData: weatherData,
              colours: colours,
            ),
          ],
        ),
      ),
    );
  }
}
