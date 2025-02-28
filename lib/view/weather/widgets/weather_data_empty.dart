import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/localization/local.dart';

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
        Localdata.noData.getString(context),
        style: TextStyle(color: colours.headingText, fontSize: 18),
      ),
    );
  }
}