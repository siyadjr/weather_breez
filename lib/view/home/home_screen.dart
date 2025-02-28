import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/core/constants/custom_scaffold.dart';
import 'package:weatherbreez/core/reusablewidgets/loading_indicator.dart';
import 'package:weatherbreez/localization/local.dart';
import 'package:weatherbreez/view/home/Widgets/location_input_field.dart';
import 'package:weatherbreez/view/home/Widgets/recent_search_maker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context, listen: false);
    final FlutterLocalization localization = FlutterLocalization.instance;

    return FadeIn(
      child: Consumer<HomeScreenProvider>(
        builder: (context, homeScreenProvider, child) => CustomScaffold(
          title: Localdata.body.getString(context),
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
                          Localdata.title.getString(context),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColours().normalHeading,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.language,
                              color: AppColours().normalHeading),
                          onPressed: () {
                            if (localization.currentLocale?.languageCode ==
                                'en') {
                              localization.translate('ml');
                            } else {
                              localization.translate('en');
                            }
                          },
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
                          Localdata.recentSearches.getString(context),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColours().normalHeading,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              provider.clearData();
                            },
                            child: Text(
                              Localdata.clear.getString(context),
                              overflow: TextOverflow.ellipsis,
                            ))
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
                          Localdata.searchText.getString(context),
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
