import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/weather/widgets/weather_details_card.dart';

class WeatherDetailsGrid extends StatelessWidget {
  final dynamic weatherData;
  final AppColours colours;

  const WeatherDetailsGrid({
    super.key,
    required this.weatherData,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        WeatherDetailCard(
          title: 'Humidity',
          value: '${weatherData.current.humidity}%',
          icon: Icons.water_drop_outlined,
          colours: colours,
        ),
        WeatherDetailCard(
          title: 'Wind',
          value: '${weatherData.current.windKph} km/h',
          icon: Icons.air,
          subtitle: weatherData.current.windDir,
          colours: colours,
        ),
        WeatherDetailCard(
          title: 'Pressure',
          value: '${weatherData.current.pressureMb} mb',
          icon: Icons.speed,
          colours: colours,
        ),
        WeatherDetailCard(
          title: 'Visibility',
          value: '${weatherData.current.visKm} km',
          icon: Icons.visibility,
          colours: colours,
        ),
        WeatherDetailCard(
          title: 'UV Index',
          value: '${weatherData.current.uv}',
          icon: Icons.wb_sunny_outlined,
          colours: colours,
        ),
        WeatherDetailCard(
          title: 'Date',
          value: weatherData.location.localtime.split(' ')[0],
          icon: Icons.calendar_today,
          colours: colours,
        ),
      ],
    );
  }
}
