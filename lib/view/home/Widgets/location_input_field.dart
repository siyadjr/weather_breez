import 'package:flutter/material.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/weather/weather_screen.dart';

class LocationInputField extends StatelessWidget {
  const LocationInputField({
    super.key,
    required this.provider,
  });

  final HomeScreenProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: provider.searchController,
        style: TextStyle(color: AppColours().normalHeading),
        decoration: InputDecoration(
            hintText: 'Search for a city...',
            hintStyle: TextStyle(color: AppColours().normalHeading),
            prefixIcon: Icon(Icons.search, color: AppColours().normalHeading),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            suffix: TextButton(
                onPressed: () {
                  if (provider.searchController.text.trim() != '') {
                    provider.addSearch(provider.searchController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>  WeatherScreen(city:provider.searchController.text)));
                  }
                },
                child: const Text('enter'))),
      ),
    );
  }
}
