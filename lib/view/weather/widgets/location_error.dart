import 'package:flutter/material.dart';
import 'package:weatherbreez/controller/weather_provider.dart';

import '../../../core/constants/app_colours.dart';

class ApiLocationError extends StatelessWidget {
  const ApiLocationError(
      {super.key,
      required this.colours,
      required this.city,
      required this.weatherProvider});

  final AppColours colours;
  final String city;
  final WeatherProvider weatherProvider;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colours.secondaryBackGroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: colours.normalHeading),
            const SizedBox(height: 16),
            Text(
              'Provided location may not popular city please try again',
              style: TextStyle(color: colours.normalHeading),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => weatherProvider.fetchWeatherData(city),
              style: ElevatedButton.styleFrom(
                backgroundColor: colours.normalHeading,
                foregroundColor: colours.headingText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
