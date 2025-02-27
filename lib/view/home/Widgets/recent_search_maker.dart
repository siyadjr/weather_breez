import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherbreez/controller/home_screen_provider.dart';
import 'package:weatherbreez/view/home/Widgets/recent_search_container.dart';

class RecentSearchMaker extends StatelessWidget {
  final HomeScreenProvider provider;
   const RecentSearchMaker({
    super.key,required this.provider
  });

  @override
  Widget build(BuildContext context) {
  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getSearchHistory();
    });
    return SizedBox(
      height: 40,
      child: Consumer<HomeScreenProvider>(
          builder: (context, homeProvider, child) =>
              homeProvider.previousSearches.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final search = homeProvider.previousSearches[index];
                        return RecentSearchContainer(
                            city: search.searchName, provider: provider,);
                      },
                      itemCount: homeProvider.previousSearches.length >= 5
                          ? 5
                          : homeProvider.previousSearches.length,
                    )
                  : const Center(
                      child: Text('no previous searches'),
                    )),
    );
  }
}
