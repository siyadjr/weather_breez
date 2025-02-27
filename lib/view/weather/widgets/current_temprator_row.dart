import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/weather/widgets/class_weather_icon.dart';
import 'package:weatherbreez/view/weather/widgets/feels_like_chip.dart';

class CurrentTemperatureRow extends StatelessWidget {
  final dynamic weatherData;
  final AppColours colours;

  const CurrentTemperatureRow({
    super.key,
    required this.weatherData,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weatherData.current.tempC}°',
              style: TextStyle(
                color: colours.normalHeading,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weatherData.current.condition.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            FeelsLikeChip(
              feelsLike: weatherData.current.feelslikeC,
              colours: colours,
            ),
          ],
        ),
        WeatherIcon(
            iconUrl: weatherData.current.condition.icon, colours: colours),
      ],
    );
  }
}