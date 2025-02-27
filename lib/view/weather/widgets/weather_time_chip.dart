import 'package:flutter/material.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';

class TimeChip extends StatelessWidget {
  final String time;
  final AppColours colours;

  const TimeChip({
    super.key,
    required this.time,
    required this.colours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colours.mainBackGroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: colours.normalHeading,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
