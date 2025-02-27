import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/weather/widgets/current_temprator_row.dart';
import 'package:weatherbreez/view/weather/widgets/location_infro_row.dart';

class CurrentWeatherCard extends StatelessWidget {
  final dynamic weatherData;
  final AppColours colours;

  const CurrentWeatherCard({
    super.key,
    required this.weatherData,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colours.secondaryBackGroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationInfoRow(
            weatherData: weatherData,
            colours: colours,
          ),
          const SizedBox(height: 30),
          CurrentTemperatureRow(
            weatherData: weatherData,
            colours: colours,
          ),
        ],
      ),
    );
  }
}