import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'weather_time_chip.dart';

class LocationInfoRow extends StatelessWidget {
  final dynamic weatherData;
  final AppColours colours;

  const LocationInfoRow({
    super.key,
    required this.weatherData,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherData.location.name,
                style: TextStyle(
                  color: colours.normalHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${weatherData.location.region}, ${weatherData.location.country}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        TimeChip(
          time: weatherData.location.localtime.split(' ')[1],
          colours: colours,
        ),
      ],
    );
  }
}