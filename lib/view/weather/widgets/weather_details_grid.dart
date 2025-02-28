import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/localization/local.dart';
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
          title: Localdata.humidity.getString(context),
          value: '${weatherData.current.humidity}%',
          icon: Icons.water_drop_outlined,
          colours: colours,
        ),
        WeatherDetailCard(
          title: Localdata.wind.getString(context),
          value: '${weatherData.current.windKph} km/h',
          icon: Icons.air,
          subtitle: weatherData.current.windDir,
          colours: colours,
        ),
        WeatherDetailCard(
          title: Localdata.pressure.getString(context),
          value: '${weatherData.current.pressureMb} mb',
          icon: Icons.speed,
          colours: colours,
        ),
        WeatherDetailCard(
          title: Localdata.visibility.getString(context),
          value: '${weatherData.current.visKm} km',
          icon: Icons.visibility,
          colours: colours,
        ),
        WeatherDetailCard(
          title: Localdata.uvIndex.getString(context),
          value: '${weatherData.current.uv}',
          icon: Icons.wb_sunny_outlined,
          colours: colours,
        ),
        WeatherDetailCard(
          title: Localdata.date.getString(context),
          value: weatherData.location.localtime.split(' ')[0],
          icon: Icons.calendar_today,
          colours: colours,
        ),
      ],
    );
  }
}
