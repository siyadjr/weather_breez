import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';

class WeatherIcon extends StatelessWidget {
  final String iconUrl;
  final AppColours colours;

  const WeatherIcon({
    super.key,
    required this.iconUrl,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https:$iconUrl',
      width: 100,
      height: 100,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.cloud,
          size: 80,
          color: colours.normalHeading,
        );
      },
    );
  }
}
