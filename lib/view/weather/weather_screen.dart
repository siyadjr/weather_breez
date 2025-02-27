import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/weather_provider.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/weather/widgets/build_loading_indicator.dart';
import 'package:weatherbreez/view/weather/widgets/location_error.dart';
import 'package:weatherbreez/view/weather/widgets/weather_content.dart';
import 'package:weatherbreez/view/weather/widgets/weather_data_empty.dart';

class WeatherScreen extends StatelessWidget {
  final String city;
  final AppColours colours = AppColours();

  WeatherScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false)
          .fetchWeatherData(city);
    });

    return Scaffold(
      backgroundColor: colours.mainBackGroundColor,
      appBar: buildAppBar(),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.isLoading) {
            return const BuildLoadingIndicator();
          }

          if (weatherProvider.error != null) {
            return ApiLocationError(
              colours: colours,
              city: city,
              weatherProvider: weatherProvider,
            );
          }

          final weatherData = weatherProvider.weatherData;
          if (weatherData == null) {
            return WeatherDataEmpty(colours: colours);
          }

          return WeatherContent(
            weatherData: weatherData,
            colours: colours,
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: colours.mainBackGroundColor.withOpacity(0.8),
      elevation: 0,
      title: Text(
        'Weather for $city',
        style: TextStyle(
          color: colours.headingText,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: colours.headingText),
    );
  }
}
















