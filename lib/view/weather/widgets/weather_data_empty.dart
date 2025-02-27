import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';

class WeatherDataEmpty extends StatelessWidget {
  const WeatherDataEmpty({
    super.key,
    required this.colours,
  });

  final AppColours colours;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No weather data available',
        style: TextStyle(color: colours.headingText, fontSize: 18),
      ),
    );
  }
}