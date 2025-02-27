import 'package:flutter/material.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';

class RecentSearchContainer extends StatelessWidget {
  const RecentSearchContainer(
      {super.key, required this.city, required this.provider});

  final String city;
  final HomeScreenProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          provider.recentToTextfield(city); 
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            city,
            style: TextStyle(color: AppColours().normalHeading),
          ),
        ),
      ),
    );
  }
}
