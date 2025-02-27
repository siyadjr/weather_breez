import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/core/constants/custom_scaffold.dart';
import 'package:weatherbreez/core/reusablewidgets/loading_indicator.dart';
import 'package:weatherbreez/view/home/Widgets/location_input_field.dart';
import 'package:weatherbreez/view/home/Widgets/recent_search_maker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context, listen: false);
    return FadeIn(
      child: Consumer<HomeScreenProvider>(
        builder: (context, homeScreenProvider, child) => CustomScaffold(
          title: 'WeatherBreez',
          showAppBar: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  FadeInLeft(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WeatherBreez',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColours().normalHeading,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.settings,
                              color: AppColours().normalHeading),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInRight(
                    child: Center(
                      child: SizedBox(
                        height: 180,
                        child: Lottie.asset(
                          'assets/Sun Animation.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LocationInputField(provider: provider),
                  const SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Searches',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColours().normalHeading,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              provider.clearData();
                            },
                            child: const Text('clear'))
                      ]),
                  const SizedBox(height: 10),
                  RecentSearchMaker(
                    provider: provider,
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Search for a city to see the weather forecast',
                          style: TextStyle(color: AppColours().normalHeading),
                          textAlign: TextAlign.center,
                        ),
                        const LoadingIndicator()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
