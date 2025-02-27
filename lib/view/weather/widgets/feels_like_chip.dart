import 'package:flutter/material.dart';

import '../../../core/constants/app_colours.dart';

class FeelsLikeChip extends StatelessWidget {
  final dynamic feelsLike;
  final AppColours colours;

  const FeelsLikeChip({
    super.key,
    required this.feelsLike,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colours.mainBackGroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Feels like $feelsLike°',
        style: TextStyle(
          color: colours.normalHeading,
        ),
      ),
    );
  }
}